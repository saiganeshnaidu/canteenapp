class FoodcategoriesController < ApplicationController
  before_action :admin_controls

  def index
    @foodcategories=Foodcategory.all
    @foodcategory=Foodcategory.new
  end

  def show
    @foodcategories=Foodcategory.find(params[:id])
  end

  def new
    @foodcategory=Foodcategory.new
  end

  def create
    @foodcategory = Foodcategory.new(foodcategory_params)
    if @foodcategory.save
      redirect_to foodcategories_path
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
    redirect_to foodcategories_path, status: :see_other
  end
  
  private
    def foodcategory_params
      params.require(:foodcategory).permit(:name, :category_image)
    end
end
