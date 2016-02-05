class Feeder < ActiveRecord::Base
  belongs_to :user
  has_many :feeds, dependent: :destroy
  has_many :questions, through: :feeds
  has_many :selections, dependent: :destroy
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

  # Returns next Feeds Question ID.
  def get_next_question_id
    # Sorts Feeds by Priority and returns the first one.
    return get_next_feed.question.id
  end

  # Returns next Feed with Priority 0 .
  def get_next_prio_0_feed
    if self.feeds.where( priority: 0 ).size <= 0
      self.add_feed
    end
    # Takes Feeds Priority 0 and returns the first one.
    return self.feeds.where( priority: 0 ).order("RANDOM()").first
  end

  # Returns next Feed with Priority 0 .
  def get_next_prio_0_question_id
    return get_next_prio_0_feed.question.id
  end


  # Dokumentieren
  def remove_feeds(participation)
    # Gehe durch jeden Feed
    self.feeds.each do |feed|
      # Teste ob der Feed zur übergebenen Participation gehört und zerstöre ihn ggf.
      feed.destroy if feed.participation == participation
    end
  end

  # Dokumentieren
  def remove_prio_zero_feeds
    # unless self.feeds.where( priority: 0 ).size >= self.feeds.size
      # Gehe durch jeden Feed
      self.feeds.each do |feed|
        # Teste ob der Feed Priorität 0 hat und zerstöre ihn ggf.
        feed.destroy if feed.priority == 0
      end
    # end
    if self.feeds.size <= 0
      self.add_feed
    end
  end


  # OPTIMIZE Hübscher und sinnvoller sollte das schon sein
  # TODO Dokumentation
  def add_feed
    self.add_selection_feed_to_feeder
  end

  # OPTIMIZE Das lässt sich bestimmt mit einem "einfachen" Aufruf viel eleganter lösen.
  def add_selection_feed_to_feeder

    #
    if self.selections.size > 0 # Wenn es mindestens eine Selection gibt
      self.selections.each do |selection| # Prüfe für jede
        if Tie.where(tag: selection.tag).size > 0 # ob es ein mindestens ein tie dazu gibt
          tie = Tie.where(tag: selection.tag).order("RANDOM()").first # wähle ggf. eins davon zufällig aus
          feed = Feed.new(:feeder_id => self.id, :question_id => tie.question.id, :priority => 0)
          feed.save # und mache einen Feed daraus.
        end
      end
    end
    #

    # # Go through questions in random order
    # Question.order("RANDOM()").each do |question|
    #   # Go through tags of the question
    #   question.tags.each do |question_tag|
    #     # Compare tags with selections
    #     self.tags.each do |selection_tag|
    #       if question_tag == selection_tag
    #         feed = Feed.new(:feeder_id => self.id, :question_id => question.id, :priority => 0)
    #         feed.save
    #         return
    #       end
    #     end
    #   end
    # end


    # When no matching questions is found an Feeder is empty, take a random one
    if self.feeds.where( priority: 0 ).size <= 0
      question = Question.order("RANDOM()").first
      feed = Feed.new(:feeder_id => self.id, :question_id => question.id, :priority => 0)
      feed.save
    end
  end

  private
    def add_feed_to_feeder # OPTIMIZE Zwei fast identische Methoden sind nicht sehr hübsch
      # question = Question.order("RANDOM()").first
      # feed = Feed.new(:feeder_id => self.id, :question_id => question.id, :priority => 0)

      # feed.save
      self.add_feed
    end

end
