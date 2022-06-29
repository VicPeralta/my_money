require 'rails_helper'

RSpec.describe 'Transactions pages', type: :feature do
  before :all do
    @first_user = User.create(
      name: 'Victor',
      email: 'victorperaltagomez@gmail.com',
      password: '121212'
    )
    @category = Category.create(user: @first_user, name: 'Groceries')
    @transaction = Entity.create(user: @first_user, category: @category, name: 'Cereal', amount: 10)
  end

  before :each do
    visit root_path
    click_button 'LOG IN'
    fill_in 'user_email', with: 'victorperaltagomez@gmail.com'
    fill_in 'user_password', with: '121212'
    click_button 'Log in'
    click_link(@category.name)
  end

  after :all do
    @transaction.destroy
    @category.destroy
    @first_user.destroy
  end

  it 'Expect section Title' do
    expect(page).to have_content('Transactions')
  end

  it 'Navigate to add transaction page' do
    click_button('Add Transaction')
    expect(current_path).to be == entity_new_path(category_id: @category.id)
  end

  it 'Add a new Transaction' do
    click_button('Add Transaction')
    fill_in 'entity_name', with: 'Apples'
    fill_in 'entity_amount', with: '15'
    click_button('Create')
    expect(Entity.last.name).to be == 'Apples'
    Entity.last.destroy
  end

  it 'Navigate to transactions\'s detail page' do
    click_link(@transaction.name)
    expect(current_path).to be == entity_detail_path(entity_id: @transaction.id)
    expect(page).to have_content('Details')
  end
end
