class User < ActiveRecord::Base
  has_secure_password
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

  has_many :received_messages, class_name: "Message",
                          foreign_key: "receiver_id"
  has_many :sended_messages, class_name: "Message",
                          foreign_key: "sender_id"


  private
    def add_feeder_to_user
      self.feeder = Feeder.new(:user_id => self.id)
      self.feeder.save
    end
end
