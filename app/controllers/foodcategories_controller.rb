class FoodcategoriesController < ApplicationController
  def index
    @foodcategories=Foodcategory.all
  end
  def show
    @foodcategories=Foodcategory.find(params[:id])
  end
  def new
    @foodcategories=Foodcategory.new
  end
  def create
    @foodcategories = Foodcategory.new(foodcategory_params)
    

    if @foodcategories.save
      redirect_to @foodcategories
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @foodcategories = Foodcategory.find(params[:id])

  end
  def update
    @foodcategories = Foodcategory.find(params[:id])

    if @foodcategories.update(foodcategory_params)
      redirect_to @foodcategories
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @foodcategories = Foodcategory.find(params[:id])
        @foodcategories.destroy
    
        redirect_to root_path, status: :see_other
  end
  private
    def foodcategory_params
      params.require(:foodcategory).permit(:name)
    end
end
