class FoodItemsController < ApplicationController
  def new
    @fooditem=FoodStore.new
  end

  def create
    @foodstore = FoodStore.find(params[:food_store_id])
    @fooditem = @foodstore.food_items.create(item_params)
    if @fooditem.save
      redirect_to food_category_food_stores_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def item_params
    params.require(:food_item).permit(:name, :price, :description, :food_store_id, :item_image)
  end
end
