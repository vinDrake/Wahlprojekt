class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge
  has_many :feeds, dependent: :destroy

  validates :user, :challenge, :strikes, presence: true
  validates :strikes, numericality: { only_integer: true }
  # validates :complete, :succeeded, inclusion: { in: [true, false] }

  after_find :check_participation
  after_create :add_challenge_feeds
  after_update :check_complete

  # TODO Dokumentieren
  # OPTIMIZE Statt after_find lieber einen job schreiben
  def check_participation
    # logger.debug "Participation touched"

    # Check strikes
    # logger.debug "Check if strikes set and out"
    if self.challenge.strikes > 0
      # logger.debug "This Challenge( "+self.challenge.name+" ) allows "+self.challenge.strikes.to_s+" strikes."
      if self.strikes >= self.challenge.strikes
        # logger.debug "This Participation has "+self.strikes.to_s+" Strikes. That's to much!"
        self.complete = true
        self.succeeded = false
      # else
        # logger.debug "This Participation has "+self.strikes.to_s+" Strikes. That's okay!"
      end
    # else
      # logger.debug "No Strikes set"
    end

    # Check challenge.alive
    # logger.debug "Check if Challeng is still alive"
    if self.challenge.alive
      # logger.debug "This Challeng is still alive."
    else
      # logger.debug "This Challenge is dead."
      self.complete = true
    end

    # Check if max_challenge_time is set and over
    if self.challenge.max_challenge_time > 0
      # logger.debug "Max Challenge Time is set"
      if (self.created_at + self.challenge.max_challenge_time) > DateTime.now
        # logger.debug "Time is over"
        self.complete = true
      # else
        # logger.debug "There is still time remaining"
      end
    # else
      # logger.debug "No Max Challenge Time is set"
    end

  end

  # Removes Participation-Feeds, when complete
  def check_complete
      self.user.feeder.remove_feeds(self) if self.complete
  end
  # End after_update

  # Add the challenges feeds to feeder
  def add_challenge_feeds

      # BasisPriorität im Feeder feststellen # OPTIMIZE Methode im Feeder schreiben
      base_priority = self.user.feeder.get_base_priority #0
      # participation.user.feeds.each do |feed|
        # if feed.priority > base_priority
          # base_priority = feed.priority
        # end
      # end
      # Ende BasisPriorität im Feeder feststellen

      # Prüfen, ob die Challenge eine feste Ordnung hat
      if self.challenge.strict_order

        # Anzahl der Fragen der Challenge festellen
        question_count = self.challenge.questions.count
        order = question_count
        # OPTIMIZE Das sollte auch mal hübsch gemacht werden
        self.challenge.questions.each do |question|
          feed = Feed.new(:feeder_id => self.user.feeder.id, :question_id => question.id, :priority => base_priority+order+1, :challenge_id => self.challenge.id, :participation_id => self.id)
          feed.save
          order -= 1
        end
      else
        self.challenge.questions.each do |question|
          feed = Feed.new(:feeder_id => self.user.feeder.id, :question_id => question.id, :priority => base_priority+1, :challenge_id => self.challenge.id, :participation_id => self.id)
          feed.save
        end
      end
      # TODO Remove Feeds with Prio 0.
      # OPTIMIZE Warum mache ich das????
      self.user.feeder.remove_prio_zero_feeds
  end
  # End after_create

  # deprechated
  # def remove_questions_from_feeder
  #   # logger.debug "Remove Questions from Feeder"
  #   current_user.feeds.each do |feed|
  #     # logger.debug "This is a Question in Feeder: "+feed.question.problem
  #     if feed.challenge = participation.challenge
  #       # logger.debug "Destroy Feed"
  #       feed.destroy
  #     end
  #   end
  # end


end
