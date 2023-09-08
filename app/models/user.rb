class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  # Attributes
  attribute :name, :string
  attribute :photo, :string
  attribute :bio, :text
  attribute :posts_counter, :integer, default: 0

  # Validations
  validates :name, presence: true

  # Associations
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def return_three_most_recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
