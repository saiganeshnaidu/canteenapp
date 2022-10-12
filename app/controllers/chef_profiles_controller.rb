class ChefProfilesController < ApplicationController
  before_action :chef?, only: [:show]
  before_action :chef_access, only: [:order, :notice]

  def new
    @chef_pro=ChefProfile.new
  end

  def create
    @chef_pro = ChefProfile.new(chef_params)  
    if @chef_pro.save
        redirect_to @chef_pro
    else
      render :new, status: :unprocessable_entity
    end    
  end

  def edit
    @chef_pro = Current.user.chef_profile
  end
    
  def update
    @chef_pro = ChefProfile.find(params[:id])
    if @chef_pro.update(chef_params)
      if admin? 
        redirect_to approvals_path
      else
        redirect_to edit_chef_profile_path(@chef_pro)
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @heading="Chef Dashboard"
    @chef_pro=ChefProfile.find(params[:id])
    @fstore=FoodStore.find(@chef_pro.food_store_id)
    @fcat=FoodCategory.find(@fstore.food_category_id)
  end

  def order
    @carts=Cart.cheforder 
  end

  def notice
    @heading="Orders on your restaurant"
  end

  def destroy
    @chef = ChefProfile.find(params[:id])
    @chef.destroy
    redirect_to root_path, status: :see_other
  end

  private

    def chef_params
      params.require(:chef_profile).permit(:name, :phone, :user_id, :food_store_id, :isapproved, :isrejected, pictures: [])
    end
end
