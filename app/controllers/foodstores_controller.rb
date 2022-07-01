class FoodstoresController < ApplicationController
    def index
        @foodstores=Foodstore.all
    end
    def show
        @foodstores=Foodstore.find(params[:id])
    end
    def new
        @foodstores=Foodstore.new
    end
    def create
        @foodstores = Foodstore.new(foodstore_params)
        
    
        if @foodstores.save
          redirect_to @foodstores
        else
          render :new, status: :unprocessable_entity
        end
    end
    def edit
        @foodstores = Foodstore.find(params[:id])
      end
    
      def update
        @foodstores = Foodstore.find(params[:id])
    
        if @foodstores.update(foodstore_params)
          redirect_to @foodstores
        else
          render :edit, status: :unprocessable_entity
        end
      end
      def destroy
        @foodstores = Foodstore.find(params[:id])
        @foodstores.destroy
    
        redirect_to root_path, status: :see_other
      end
    private
    def foodstore_params
        params.require(:foodstore).permit(:name)
    end
end
