class FooditemsController < ApplicationController
  def new
    @fooditem=Foodstore.new
  end
    def create
      @foodstore = Foodstore.find(params[:foodstore_id])
      @fooditem = Fooditem.create(item_params)
      if @fooditem.save
      redirect_to foodstore_path(@foodstore)
    else
      render :new, status: :unprocessable_entity
    end
      end
      private
      def item_params
        params.require(:fooditem).permit(:name, :price, :description, :foodstore_id)
      end
end
