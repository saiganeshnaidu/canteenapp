class FoodStoresController < ApplicationController
  before_action :foodstore_access

  def create
    @foodcategory = FoodCategory.find(params[:food_category_id])
    @foodstore = @foodcategory.food_stores.create(store_params)
    redirect_to food_category_path(@foodcategory)
  end

  def show
    @foodcategory = FoodCategory.find(params[:food_category_id])
    @foodstore=FoodStore.find(params[:id])
  end

  def destroy
    @foodcategory = FoodCategory.find(params[:food_category_id])
    @foodstore = @foodcategory.food_stores.find(params[:id])
    @foodstore.destroy
    redirect_to food_category_path, status: :see_other
  end
  
  private
    def store_params
      params.require(:food_store).permit(:name, :image)
    end
end
