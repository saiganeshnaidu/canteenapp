class FooditemsController < ApplicationController
  def new
    @fooditem=Foodstore.new
  end

  def create
    @foodstore = FoodStore.find(params[:food_store_id])
    @fooditem = @foodstore.fooditems.create(item_params)
    if @fooditem.save
      redirect_to foodcategory_food_stores_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:fooditem).permit(:name, :price, :description, :food_store_id, :item_image)
  end
end
