require 'rails_helper'

RSpec.describe 'Category pages', type: :feature do
  before :all do
    @first_user = User.create(
      name: 'Victor',
      email: 'victorperaltagomez@gmail.com',
      password: '121212'
    )
    @category = Category.create(user: @first_user, name: 'Groceries')
  end

  before :each do
    visit root_path
    click_button 'LOG IN'
    fill_in 'user_email', with: 'victorperaltagomez@gmail.com'
    fill_in 'user_password', with: '121212'
    click_button 'Log in'
  end

  after :all do
    @category.destroy
    @first_user.destroy
  end

  it 'Expect section Title' do
    expect(page).to have_content('Categories')
  end

  it 'Expect to have category Groceries' do
    path = "//div[@data-id=\"category-#{@category.id}\"]"
    expect(page.has_xpath?(path, count: 1) &&
           page.has_content?(@category.name)).to be true
  end

  it 'Navigate to categorie\'s transaction page' do
    click_link(@category.name)
    expect(current_path).to be == entity_index_path
    expect(page).to have_content('Transactions')
  end

  it 'Navigate to add category page' do
    click_button('Add Category')
    expect(current_path).to be == categories_new_path
  end

  it 'Add a new Category' do
    click_button('Add Category')
    fill_in 'category_name', with: 'Movies'
    click_button('Create')
    expect(Category.last.name).to be == 'Movies'
    Category.last.destroy
  end
end
