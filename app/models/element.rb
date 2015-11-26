class Element < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :question
end
