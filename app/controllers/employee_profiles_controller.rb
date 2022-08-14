class EmployeeProfilesController < ApplicationController
    def new
        @emp_pro=EmployeeProfile.new
        @company=Company.all
    end
    def show
        @emp_pro=EmployeeProfile.find(params[:id])
    end
    def create
        @emp_pro = EmployeeProfile.new(emp_params)
      
  
        if @emp_pro.save
                redirect_to employee_profiles_path

        else
          render :new, status: :unprocessable_entity
        end    
    end
    def index
        @emp_pro=EmployeeProfile.all
    end
    def destroy
        @emp_pro = EmployeeProfile.find(params[:id])
        @emp_pro.destroy
    
        redirect_to root_path, status: :see_other
      end
      def edit
        @emp_pro = EmployeeProfile.find(params[:id])
      end
    
      def update
        @emp_pro = EmployeeProfile.find(params[:id])
        if @emp_pro.update(emp_params)
          if @emp_pro.isrejected
            @user=User.find_by(id: @emp_pro[:user_id])
            @user.destroy
            redirect_to root_path
            else
          redirect_to root_path
          end
        else
          render :edit, status: :unprocessable_entity
        end
      end
    private
    def emp_params
      params.require(:employee_profile).permit(:name, :phone, :user_id, :company_id, :isapproved, :isrejected)
    end
end
