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
      render new, alert: 'There was an error'
    end
  end

  private

  def category_params
    params.require(:category).permit(:user, :name, :image)
  end
end
