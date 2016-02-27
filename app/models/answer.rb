class Answer < ActiveRecord::Base
  belongs_to :question
  validates :question, :answer_body, presence: true
  validates :correct, inclusion: { in: [true, false] }

end
