class FoodstoresController < ApplicationController
  before_action :foodstore_access

  def create
    @foodcategory = Foodcategory.find(params[:foodcategory_id])
    @foodstore = @foodcategory.foodstores.create(store_params)
    redirect_to foodcategory_path(@foodcategory)
  end

  def show
    @foodcategory = Foodcategory.find(params[:foodcategory_id])
    @foodstore=Foodstore.find(params[:id])
  end

  def destroy
    @foodcategory = Foodcategory.find(params[:foodcategory_id])
    @foodstore = @foodcategory.foodstores.find(params[:id])
    @foodstore.destroy
    redirect_to foodcategory_path, status: :see_other
  end
  
  private
    def store_params
      params.require(:foodstore).permit(:name, :image)
    end
end
