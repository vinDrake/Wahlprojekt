class Answer < ActiveRecord::Base
  belongs_to :question
  validates :question, :answer_body, presence: true
  validates :answer_body, uniqueness: true, length: { in: 3..255 }
  validates :correct, inclusion: { in: [true, false] }

end
