require 'rails_helper'

RSpec.feature 'Post Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Waweru', photo: 'https://placehold.co/200x133', bio: 'Your Bio', posts_counter: 0)
    @post1 = @user.posts.create(title: 'Post Title', content: 'Post Body', comments_counter: 0, likes_counter: 0)
    Comment.create(post: @post1, author: @user, text: 'cool staff')
    Like.create(post: @post1, author: @user)
  end

  describe 'Post show page' do
    before(:each) { visit user_post_path(@user, @post1) }

    it 'I can see who wrote the post' do
      expect(page).to have_content('Waweru')
    end

    it 'I can see how many likes it has' do
      expect(page).to have_content('Likes: 1')
    end

    it 'I can see the post body' do
      expect(page).to have_content('Post Body')
    end

    it 'I can see the username of each commentor and the comment each commentor left' do
      expect(page).to have_content('Waweru: cool staff')
    end
  end
end
