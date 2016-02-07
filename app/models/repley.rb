class Repley < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  validates :user, :question, :answer, :points, presence: true

  # TODO Dokumentieren

  # TODO check_correct


end
