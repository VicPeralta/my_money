class EntityController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @entities = Entity.where(category_id: params[:category_id], user: current_user).order('created_at DESC')
  end

  def show
    @transaction = Entity.find(params[:entity_id])
    @category = Category.find(params[:category_id])
  end

  def new
    puts 'Processing new'
    @category = Category.find(params[:category_id])
    @entity = Entity.new
  end

  def create
    puts 'Processing create'
    transaction = Entity.new(entity_params)
    transaction.category_id = params[:category_id]
    transaction.user = current_user
    if transaction.valid?
      transaction.save
      redirect_to entity_index_path(category_id: params[:category_id]), notice: 'Transaction added'
    else
      redirect_to entity_new_path(category_id: params[:category_id]),
                  alert: transaction.errors.first.message, status: 400
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
