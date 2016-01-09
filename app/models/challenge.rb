class Challenge < ActiveRecord::Base
  has_many :participations
  has_many :users, through: :participations
  has_many :elements
  has_many :questions, through: :elements
  has_many :feeds

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
