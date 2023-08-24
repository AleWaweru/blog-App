require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'updates the comments counter for a post after creating a comment' do
    user = User.create(name: 'Test User')
    post = Post.create(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)
    Comment.create(author: user, post:, text: 'Test comment')
    post.reload
    expect(post.comments_counter).to eq(1)
  end
end
