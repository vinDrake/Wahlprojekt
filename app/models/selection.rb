class Selection < ActiveRecord::Base
  belongs_to :tag
  belongs_to :feeder
  has_one :user, through: :feeder

  validates :tag, :feeder, presence: true

  # TODO Dokumentieren

  # Begin after_create
  after_create do |selection|

      # TODO Remove Feeds with Prio 0
      selection.user.feeder.remove_prio_zero_feeds
      selection.user.feeder.add_feed

  end
  # End after_create



end
