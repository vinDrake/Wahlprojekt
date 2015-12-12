class Feed < ActiveRecord::Base
  belongs_to :feeder
  belongs_to :question
  validates :feeder, :question, presence: true
end
