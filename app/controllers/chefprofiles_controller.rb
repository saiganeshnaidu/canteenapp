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
          if @chef_pro.isrejected
            
            redirect_to chefprofiles_path
            else
          redirect_to chefprofiles_path
          end
        else
          render :edit, status: :unprocessable_entity
        end
      end
      def show
        @chef_pro=Chefprofile.find(params[:id])
    end
    def order
      @chef_pro = Chefprofile.find_by(params[:id])

      @carts=Cart.all
    end
    private
    def chef_params
      params.require(:chefprofile).permit(:name, :phone, :user_id, :foodstore_id, :isapproved, :isrejected)
    end
end
