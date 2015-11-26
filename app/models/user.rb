class User < ActiveRecord::Base
  has_secure_password

  has_many :repleys
  has_many :questions, through: :repleys
  has_many :participations
  has_many :challenges, through: :participations
  has_one :feeder
  has_many :feeds, through: :feeder

  has_many :received_messages, class_name: "Message",
                          foreign_key: "receiver_id"
  has_many :sended_messages, class_name: "Message",
                          foreign_key: "sender_id"
end
