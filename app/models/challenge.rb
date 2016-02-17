class Challenge < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :elements, dependent: :destroy
  has_many :questions, through: :elements
  has_many :feeds, dependent: :destroy

  validates :name , length: { in: 3..255 }
  validates :max_challenge_time, :strikes , numericality: { only_integer: true , greater_than_or_equal_to: 0 }
  # validates :latest_end , numericality: { greater_than_or_equal_to: DateTime.now } GEht so nicht
  validates :name, :max_challenge_time, :latest_end, :strikes, presence: true
  validates :alive, :strict_order, inclusion: { in: [true, false] }

  after_find do |challenge|
    logger.debug "Challenge touched"
    if self.latest_end < DateTime.now
      logger.debug "Challenge ended"
      self.alive = false
    else
      logger.debug "Challenge not ended"
    end

  end

  # Checks, if Challenge is alive and sets Participations complete, if not
  def check_life_signs
    unless self.alive
      kill_participations
    end
  end

  # Returns active User in this Challenge
  def get_active_users
    return Participation.where({ challenge: self, complete: false })
  end

  # Returns complete User in this Challenge
  def get_complete_users
    return Participation.where({ challenge: self, complete: true })
  end

  # Returns complete User in this Challenge
  def get_succeeded_users
    return Participation.where({ challenge: self, succeeded: true })
  end

  # Sets all Participations from this Challenge complete
  def kill_participations
    self.participations.each do |participation|
      participation.complete = true
      participation.save
    end
  end

  # Class Methods
  class << self

    # Returns the alive Challenges
    def get_alive_challenges
      alive_challenges = Array.new
      Challenge.all.each do |challenge|
        alive_challenges << challenge if challenge.alive
      end
      return alive_challenges
    end

  end # End Class Methods

end
