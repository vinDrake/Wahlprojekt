class Answer < ActiveRecord::Base
  belongs_to :question
  validates :question, presence: true
  validates :correct, inclusion: { in: [true, false] }

end
