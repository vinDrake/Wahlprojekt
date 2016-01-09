class Feeder < ActiveRecord::Base
  belongs_to :user
  has_many :feeds
  has_many :questions, through: :feeds
  has_many :selections
  has_many :tags, through: :selections

  validates :user, presence: true

  after_create :add_feed_to_feeder

  # TODO Dokumentieren
  # OPTIMIZE Code aufräumen

  # Returns next Feed.
  def get_next_feed
    # Sorts Feeds by Priority and returns the first one.
    return self.feeds.order(priority: :desc).first
  end

  # TODO remove_feeds(participation)



  # OPTIMIZE Hübscher und sinnvoller sollte das schon sein
  # TODO Dokumentation
  def add_feed
    self.add_selection_feed_to_feeder
  end

  # OPTIMIZE Das lässt sich bestimmt mit einem "einfachen" Aufruf viel eleganter lösen.
  def add_selection_feed_to_feeder
    # Go through questions in random order
    Question.order("RANDOM()").each do |question|
      # Go through tags of the question
      question.tags.each do |question_tag|
        # Compare tags with selections
        self.tags.each do |selection_tag|
          if question_tag == selection_tag
            feed = Feed.new(:feeder_id => self.id, :question_id => question.id, :priority => 0)
            feed.save
            return
          end
        end
      end
    end
    # When no matching questions is found, take a random one
    question = Question.order("RANDOM()").first
    feed = Feed.new(:feeder_id => self.id, :question_id => question.id, :priority => 0)
    feed.save
  end

  private
    def add_feed_to_feeder # OPTIMIZE Zwei fast identische Methoden sind nicht sehr hübsch
      question = Question.order("RANDOM()").first
      feed = Feed.new(:feeder_id => self.id, :question_id => question.id, :priority => 0)

      feed.save
    end

end
