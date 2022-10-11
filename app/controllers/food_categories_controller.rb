class FoodCategoriesController < ApplicationController
  before_action :admin_controls

  def index
    @foodcategories=FoodCategory.all
    @foodcategory=FoodCategory.new
  end

  def show
    @foodcategories=FoodCategory.find(params[:id])
  end

  def new
    @foodcategory=FoodCategory.new
  end

  def create
    @foodcategory = FoodCategory.new(food_category_params)
    if @foodcategory.save
      redirect_to food_categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @foodcategories = FoodCategory.find(params[:id])
  end

  def update
    @foodcategories = FoodCategory.find(params[:id])
    if @foodcategories.update(food_category_params)
      redirect_to @foodcategories
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @foodcategories = FoodCategory.find(params[:id])
    @foodcategories.destroy
    redirect_to food_categories_path, status: :see_other
  end
  
  private
    def food_category_params
      params.require(:food_category).permit(:name, :category_image)
    end
end
