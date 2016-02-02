class Tie < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag

  validates :question, :tag, presence: true

  # TODO Dokumentieren

  # TODO Validieren, dass es nur ein Tie bei einem Frage/Antwort-Paar gibt

  
end
