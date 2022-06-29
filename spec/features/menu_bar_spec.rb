require 'rails_helper'

RSpec.describe 'Menu bar', type: :feature do
  before :all do
    Entity.all.destroy_all
    Category.all.destroy_all
    User.all.destroy_all
    @first_user = User.create(
      name: 'Victor',
      email: 'victorperaltagomez@gmail.com',
      password: '121212'
    )
    @category = Category.create(user: @first_user, name: 'Groceries')
    @transaction = Entity.create(user: @first_user, category: @category, name: 'Cereal', amount: 10)
  end

  after :all do
    @transaction.destroy
    @category.destroy
    @first_user.destroy
  end

  before :each do
    visit root_path
    click_button 'LOG IN'
    fill_in 'user_email', with: 'victorperaltagomez@gmail.com'
    fill_in 'user_password', with: '121212'
    click_button 'Log in'
  end

  it 'Log out' do
    click_button(class: 'hamburger-button')
    click_link('Log out')
    expect(current_path).to be == root_path
  end
end
