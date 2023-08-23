class User < ApplicationRecord
  validates :name, presence: true
  attr_accessor :photo
  attr_accessor :bio

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def return_three_most_recent_post(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
