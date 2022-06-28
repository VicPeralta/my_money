class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:entities).where(user: current_user)
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    category.user = current_user
    if category.valid?
      category.save
      redirect_to categories_index_path, notice: 'Category added'
    else
      redirect_to categories_new_path, alert: category.errors.first.message, status: 400
    end
  end

  private

  def category_params
    params.require(:category).permit(:user, :name, :image)
  end
end
