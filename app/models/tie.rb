class Tie < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag
  validates :question, :tag, presence: true
  validates :question, :tag, numericality: { only_integer: true }
end
