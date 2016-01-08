class Feed < ActiveRecord::Base
  belongs_to :feeder
  belongs_to :question
  belongs_to :challenge
  belongs_to :participation
  validates :priority, :feeder, :question, presence: true
end
