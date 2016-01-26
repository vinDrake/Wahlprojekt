class User < ActiveRecord::Base
  has_secure_password

  validates :name, uniqueness: true
  validates :name, :email, :password_digest, presence: true
  validates :name, format: { with: /\A[a-zA-Z0-9]+\z/,
    message: "only allows letters and numbers" }, length: { in: 4..24 }

  after_create :add_feeder_to_user

  has_many :repleys, dependent: :destroy
  has_many :questions, through: :repleys
  has_many :participations, dependent: :destroy
  has_many :challenges, through: :participations
  has_one :feeder, dependent: :destroy
  has_many :feeds, through: :feeder
  has_many :selections, through: :feeder
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships

  has_many :received_messages, class_name: "Message",
                          foreign_key: "receiver_id"
  has_many :sended_messages, class_name: "Message",
                          foreign_key: "sender_id"

  # TODO Dokumentieren
  # OPTIMIZE Code Aufräumen


  # Class Methods
  class << self
    # Returns the first User with the highest Score
    def get_highscore_user
      highscore = 0
      highscore_user = User.first
      User.all.each do |user|
        if user.achieved_points > highscore
          highscore = user.achieved_points
          highscore_user = user
        end
      end
      return highscore_user
    end

  end
  # End of Class Methods

  #
  def all_messages
    messages = Array.new
    messages.concat( self.received_messages )
    messages.concat( self.sended_messages )
    return messages
  end

    #
    def incoming_messages
      return self.received_messages.order(created_at: :desc)
    end

    #
    def leaving_messages
      return self.sended_messages.order(created_at: :desc)
    end

  # Returns an Array containing the other Users.
  def other_users
    others = Array.new
    others.concat( User.all )
    others.delete(self)
    return others
  end

  # Returns next Feed.
  def get_next_feed
    return self.feeder.get_next_feed
  end

  # Returns Number of answerd Questions.
  def question_count
    #
    return self.repleys.size
  end

  # Returns the achieved Points.
  def achieved_points
    #
    points = 0
    self.repleys.each do |repley|
      unless repley.points.nil?
        points += repley.points
      end
    end
    return points
  end

  private
    def add_feeder_to_user
      self.feeder = Feeder.new(:user_id => self.id)
      self.feeder.save
    end
end
