class Repley < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  validates :user, :question, :answer, :points, presence: true

  after_create :restock
  after_create :clean_up

  # TODO Dokumentieren

  # TODO check_correct

  private

    def restock
      self.user.feeder.add_feed
    end

    def clean_up
      self.user.feeds.find_by(question: self.question).destroy unless self.user.feeds.find_by(question: self.question).nil?
    end
end
