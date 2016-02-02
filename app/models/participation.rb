class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge
  has_many :feeds

  validates :user, :challenge, :strikes, presence: true
  validates :strikes, numericality: { only_integer: true }
  # validates :complete, :succeeded, inclusion: { in: [true, false] }


  # TODO Dokumentieren
  # OPTIMIZE
  after_find do |participation|
    logger.debug "Participation touched"


    logger.debug "Check if strikes set and out"
    if self.challenge.strikes > 0
      logger.debug "This Challenge( "+self.challenge.name+" ) allows "+self.challenge.strikes.to_s+" strikes."
      if self.strikes >= self.challenge.strikes
        logger.debug "This Participation has "+self.strikes.to_s+" Strikes. That's to much!"
        self.complete = true
        self.succeeded = false
      else
        logger.debug "This Participation has "+self.strikes.to_s+" Strikes. That's okay!"
      end
    else
      logger.debug "No Strikes set"
    end

    logger.debug "Check if Challeng is still alive"
    if self.challenge.alive
      logger.debug "This Challeng is still alive."
    else
      logger.debug "This Challenge is dead."
      self.complete = true
    end

    logger.debug "Check if max_challenge_time is set and over"
    if self.challenge.max_challenge_time > 0
      logger.debug "Max Challenge Time is set"
      if (self.created_at + self.challenge.max_challenge_time) > DateTime.now
        logger.debug "Time is over"
        self.complete = true
      else
        logger.debug "There is still time remaining"
      end
    else
      logger.debug "No Max Challenge Time is set"
    end

  end

  # Begin after_update
  after_update do |participation|
    if participation.complete
      logger.debug "Check if Participation is complete!"
      # Replaced with nicer method
      # remove_questions_from_feeder
      self.user.feeder.remove_feeds(self)

    end
  end
  # End after_update

  # Begin after_create
  after_create do |participation|

      # BasisPriorität im Feeder feststellen # OPTIMIZE Methode im Feeder schreiben
      base_priority = 0
      participation.user.feeds.each do |feed|
        if feed.priority > base_priority
          base_priority = feed.priority
        end
      end
      # Ende BasisPriorität im Feeder feststellen

      # Prüfen, ob die Challenge eine feste Ordnung hat
      if participation.challenge.strict_order

        # Anzahl der Fragen der Challenge festellen
        question_count = participation.challenge.questions.count
        order = question_count
        # OPTIMIZE Das sollte auch mal hübsch gemacht werden
        participation.challenge.questions.each do |question|
          feed = Feed.new(:feeder_id => participation.user.feeder.id, :question_id => question.id, :priority => base_priority+order+1, :challenge_id => participation.challenge.id, :participation_id => participation.id)
          feed.save
          order -= 1
        end
      else
        participation.challenge.questions.each do |question|
          feed = Feed.new(:feeder_id => participation.user.feeder.id, :question_id => question.id, :priority => base_priority+1, :challenge_id => participation.challenge.id, :participation_id => participation.id)
          feed.save
        end
      end
      # TODO Remove Feeds with Prio 0
      participation.user.feeder.remove_prio_zero_feeds
  end
  # End after_create

  def remove_questions_from_feeder
    logger.debug "Remove Questions from Feeder"
    current_user.feeds.each do |feed|
      logger.debug "This is a Question in Feeder: "+feed.question.problem
      if feed.challenge = participation.challenge
        logger.debug "Destroy Feed"
        feed.destroy
      end
    end
  end


end
