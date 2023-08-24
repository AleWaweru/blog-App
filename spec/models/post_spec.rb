require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is not valid without a title' do
    post = Post.new(comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'is not valid if title exceeds 250 characters' do
    post = Post.new(title: 'A' * 251, comments_counter: 0, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'is not valid with negative comments counter' do
    post = Post.new(title: 'Test Title', comments_counter: -1, likes_counter: 0)
    expect(post).to_not be_valid
  end

  it 'is not valid with negative likes counter' do
    post = Post.new(title: 'Test Title', comments_counter: 0, likes_counter: -1)
    expect(post).to_not be_valid
  end
end
