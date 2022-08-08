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
            if @emp_pro.isapproved
                redirect_to root_path
            else
                redirect_to employee_profiles_path
            end
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
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
      end
    private
    def emp_params
      params.require(:employee_profile).permit(:name, :phone, :user_id, :company_id, :isapproved, :isrejected)
    end
end
