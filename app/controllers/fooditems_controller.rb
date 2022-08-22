class FooditemsController < ApplicationController
  def new
    @fooditem=Foodstore.new
  end
    def create
      @foodstore = Foodstore.find(params[:foodstore_id])
      @fooditem = @foodstore.fooditems.create(item_params)

      if @fooditem.save
      redirect_to foodcategory_foodstores_path

    else
      render :new, status: :unprocessable_entity
    end
      end
      private
      def item_params
        params.require(:fooditem).permit(:name, :price, :description, :foodstore_id)
      end
end
