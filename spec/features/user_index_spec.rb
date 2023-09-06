require 'rails_helper'

RSpec.feature 'User Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'mark', bio: 'Teacher from Mexico.', posts_counter: 3)
  end

  describe 'User index page' do
    before(:each) { visit users_path }

    it 'displays the username of each user' do
      expect(page).to have_content('mark')
    end

    it 'displays the number of posts of each user' do
      expect(page).to have_content('Number of posts: 3')
    end

    it 'is redirected to that user\'s show page when clicking on a user' do
      click_link('mark')
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
