require 'rails_helper'

RSpec.describe 'User model', type: :request do
  it 'Create a valid user' do
    user = User.new(name: 'Victor',
                    email: 'victor.peralta.gomez@gmail.com',
                    password: '121212')
    expect(user).to be_valid
  end

  it 'Create an invalid user due to empty name' do
    user = User.new(name: '',
                    email: 'victor.peralta.gomez@gmail.com',
                    password: '121212')
    expect(user).to_not be_valid
    expect(user.errors[:name][0]).to be == "Name can't be blank"
  end
end
