class EntityController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @entities = Entity.where(category_id: params[:category_id], user: current_user)
  end
end
