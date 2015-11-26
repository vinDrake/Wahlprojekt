class Selection < ActiveRecord::Base
  belongs_to :tag
  belongs_to :feeder
  has_one :user, through: :feeder
end
