class Repley < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer
  validates :user, :question, :answer, presence: true
  validates :user, :question, :answer, numericality: { only_integer: true }
end
