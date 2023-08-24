require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name and valid posts_counter' do
    user = User.new(name: 'John Doe', posts_counter: 5)
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(posts_counter: 5)
    expect(user).to be_invalid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a negative posts_counter' do
    user = User.new(name: 'John Doe', posts_counter: -1)
    expect(user).to be_invalid
    expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
  end
end
