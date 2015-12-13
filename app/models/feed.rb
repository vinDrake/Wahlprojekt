class Feed < ActiveRecord::Base
  belongs_to :feeder
  belongs_to :question
  validates :priority, :feeder, :question, presence: true
end
