class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge
  validates :user, :challenge, :strikes, presence: true
  validates :strikes, numericality: { only_integer: true }
  validates :complete, :succeeded, inclusion: { in: [true, false] }

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

end
