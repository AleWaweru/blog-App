class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { in: 3..250 }
  validates :content, presence: true, length: { in: 3..100 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Define posts_counter as an attribute with a default value of 0
  attribute :posts_counter, :integer, default: 0

  after_save :update_user_post_counter
  after_create :initialize_counters

  def five_most_recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  private

  def update_user_post_counter
    author.increment!(:posts_counter)
  end

  def initialize_counters
    self.comments_counter = 0
    self.likes_counter = 0
  end
end
