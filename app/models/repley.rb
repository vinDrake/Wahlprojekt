class Repley < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  validates :user, :question, :answer, :points, presence: true

  after_create :restock

  # TODO Dokumentieren

  # TODO check_correct

  private

    def restock
      self.user.feeder.add_feed
    end

end
