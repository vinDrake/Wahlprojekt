class Message < ActiveRecord::Base
  belongs_to :sender,:foreign_key => :sender_id, class_name: "User"
  belongs_to :receiver,:foreign_key => :receiver_id, class_name: "User"
  validates :sender, :receiver, :subject, :content, presence: true
  validates :sender, :receiver, numericality: { only_integer: true }
end
