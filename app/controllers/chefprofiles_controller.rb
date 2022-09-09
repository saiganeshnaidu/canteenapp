class ChefprofilesController < ApplicationController
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
    def index
        @chef_pro=Chefprofile.all
    end
    def edit
        @chef_pro = Chefprofile.find(params[:id])
      end
    
      def update
        @chef_pro = Chefprofile.find(params[:id])
        if @chef_pro.update(chef_params)
          if Current.user && Current.user.usertype=="Admin"
            redirect_to chefprofiles_path
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
      @chef_pro = Chefprofile.find(params[:chefid])

      @carts=Cart.all.order("created_at DESC")
    end
    def notice

    end
    private
    def chef_params
      params.require(:chefprofile).permit(:name, :phone, :user_id, :foodstore_id, :isapproved, :isrejected, pictures: [])
    end
end
