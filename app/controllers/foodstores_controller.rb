class FoodstoresController < ApplicationController
  
  def create
    @foodcategory = Foodcategory.find(params[:foodcategory_id])
    @foodstore = @foodcategory.foodstores.create(store_params)
    redirect_to foodcategory_path(@foodcategory)
  end
  def destroy
    @foodstore = Foodstore.find(params[:id])
    @foodstore.destroy

    redirect_to root_path, status: :see_other
  end
  private
    def store_params
      params.require(:foodstore).permit(:name)
    end
end
