class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge
  validates :user, :challenge, :strikes, presence: true
  validates :complete, :succeeded, inclusion: { in: [true, false] }
end
