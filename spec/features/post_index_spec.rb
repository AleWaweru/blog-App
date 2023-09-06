require 'rails_helper'

RSpec.feature 'Post Index Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Alexi', bio: 'Programmer')
    @user.posts.create(title: 'Hello', content: 'Hello', comments_counter: 0, likes_counter: 0)
  end

  describe 'User post index page' do
    before(:each) { visit user_posts_path(@user) }

    it 'displays the user profile picture' do
      expect(page.has_xpath?("//img[@src='Your Profile Picture URL']"))
    end

    it 'displays the user\'s username' do
      expect(page).to have_content('Alexi')
    end

    it 'displays the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 1') # Adjust the count as needed
    end

    it 'displays a post\'s title' do
      expect(page).to have_content('Hello')
    end

    it 'displays some of the post\'s body' do
      expect(page).to have_content('Hello') # You can adjust the content as needed
    end

    it 'displays how many likes a post has' do
      expect(page).to have_content('Likes: 0') # Adjust the count as needed
    end

    it 'redirects to the post show page when clicking on a post' do
      click_link('Hello')
      expect(page).to have_current_path(user_post_path(user_id: @user.id, id: @user.posts.first.id))
    end
  end
end
