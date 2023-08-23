class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  attr_accessor :text, :title, :content, :comments_counter, :likes_counter

  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_author_posts_count

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_author_posts_count
    author.update(posts_counter: author.posts.count)
  end
end
