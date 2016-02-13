class Selection < ActiveRecord::Base
  belongs_to :tag
  belongs_to :feeder
  has_one :user, through: :feeder

  validates :tag, :feeder, presence: true
  validate :can_not_be_a_selection_clone

  # TODO Dokumentieren

  # Validates if the same Selection already exists
  def can_not_be_a_selection_clone
    unless self.tag.nil? || self.feeder.nil?
      if Selection.where( feeder: self.feeder ).where( tag: self.tag ).exists?
        errors.add(:selection, "is a clone")
      end
    end
  end

  # Begin after_create
  after_create do |selection|

      # Remove Feeds with Prio 0
      selection.user.feeder.remove_prio_zero_feeds
      # Add new Feeds
      # selection.user.feeder.add_feed # Wird in remove_prio_zero_feeds gemacht

  end
  # End after_create

  # Begin after_destroy
  after_destroy do |selection|

      # Remove Feeds with Prio 0 and add new Feeds
      selection.user.feeder.remove_prio_zero_feeds

  end
  # End after_destroy



end
