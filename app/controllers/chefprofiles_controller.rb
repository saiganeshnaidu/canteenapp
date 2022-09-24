class ChefprofilesController < ApplicationController
  before_action :chef?, only: [:show]
  before_action :chef_access, only: [:order, :notice]

  def new
    @chef_pro=Chefprofile.new
    @foodstore=Foodstore.all
  end

  def create
    @chef_pro = Chefprofile.new(chef_params)  
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
    @chef_pro = Chefprofile.find(params[:id])
    if @chef_pro.update(chef_params)
      if admin? 
        redirect_to approvals_path
      else
        redirect_to edit_chefprofile_path(@chef_pro)
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @chef_pro=Chefprofile.find(params[:id])
    @fstore=Foodstore.find(@chef_pro.foodstore_id)
    @fcat=Foodcategory.find(@fstore.foodcategory_id)
  end

  def order
    @carts=Cart.cheforder 
  end

  def notice

end

  private

    def chef_params
      params.require(:chefprofile).permit(:name, :phone, :user_id, :foodstore_id, :isapproved, :isrejected, pictures: [])
    end
end
