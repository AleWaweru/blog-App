require 'rails_helper'

RSpec.shared_examples 'user information display' do
  it 'displays user information' do
    expect(page).to have_content('Alexi')
    expect(page).to have_content('Programmer')
  end

  it "displays the user's first 3 posts" do
    expect(page).to have_content('Hello')
    # You can add expectations for the other two posts here
  end

  it "displays a button that lets me view all of a user's posts" do
    expect(page).to have_link('See all posts', href: user_posts_path(@first_user))
  end
end

RSpec.feature 'User Show Page', type: :feature do
  before(:each) do
    @first_user = User.create(
      name: 'Alexi',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Programmer',
      posts_counter: 2
    )
    @first_user.posts.create(title: 'Hello', content: 'This is a program post', comments_counter: 0, likes_counter: 0)
  end

  describe 'User show page' do
    before(:each) { visit user_path(id: @first_user.id) }

    it_behaves_like 'user information display'

    it 'redirects to open all posts of a user when the button is clicked' do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@first_user))
    end

    it 'redirects to open a post of a user when a post is clicked' do
      click_link('Hello')
      expect(page).to have_current_path(user_post_path(user_id: @first_user.id, id: @first_user.posts.first.id))
    end
  end
end
