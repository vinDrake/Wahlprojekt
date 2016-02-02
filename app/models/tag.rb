class Tag < ActiveRecord::Base
  has_many :ties, :class_name => 'Tie', dependent: :destroy
  has_many :questions, through: :ties
  has_many :selections, dependent: :destroy
  has_many :feeder, through: :selections

  validates :name, presence: true, uniqueness: true

  # TODO Dokumentieren

  # TODO Validieren, ob es schon ein gleiches/ähnliches gibt - DONE


end
