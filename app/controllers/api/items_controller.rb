class Api::ItemsController < ApiController
  
  before_action :authenticated?
 
  def create
    list = List.find(params[:list_id])
    item = list.items.build(item_params)
    if item.save
      render json: item
    else
      render json: {errors: item.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def item_params
    params.require(:item).permit(:name)
  end
 
end