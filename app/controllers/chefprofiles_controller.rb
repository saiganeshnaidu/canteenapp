class ChefprofilesController < ApplicationController
    def new
        @chef_pro=Chefprofile.new
        @foodstore=Foodstore.all
    end
    def create
        @chef_pro = Chefprofile.new(chef_params)
      
  
        if @chef_pro.save
                redirect_to chefprofiles_path
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
            @user=User.find_by(id: @chef_pro[:user_id])
            @user.destroy
            redirect_to root_path
            else
          redirect_to root_path
          end
        else
          render :edit, status: :unprocessable_entity
        end
      end
      def show
        @chef_pro=Chefprofile.find(params[:id])
    end
    private
    def chef_params
      params.require(:chefprofile).permit(:name, :phone, :user_id, :foodstore_id, :isapproved, :isrejected)
    end
end
