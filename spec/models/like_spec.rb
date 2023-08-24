require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'updates the likes counter for a post after creating a like' do
    user = User.create(name: 'Test User')
    post = Post.create(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)
    Like.create(author: user, post:)
    post.reload
    expect(post.likes_counter).to eq(1)
  end
end
