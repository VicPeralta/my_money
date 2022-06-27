class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:entities).where(
      user: current_user, entities: { user: current_user }
    )
  end
end
