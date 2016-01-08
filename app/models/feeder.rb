class Feeder < ActiveRecord::Base
  belongs_to :user
  has_many :feeds
  has_many :questions, through: :feeds
  validates :user, presence: true

  after_create :add_feed_to_feeder

  # Returns next Feed.
  def get_next_feed
    # Sorts Feeds by Priority and returns the first one.
    return self.feeds.order(priority: :desc).first
  end

  private
    def add_feed_to_feeder

      question = Question.order("RANDOM()").first
      feed = Feed.new(:feeder_id => self.id, :question_id => question.id, :priority => 0)

      feed.save
    end

end
