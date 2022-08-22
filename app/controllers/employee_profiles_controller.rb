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
                redirect_to @emp_pro

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
        @emp_pros=EmployeeProfile.all

        @emp_pro = EmployeeProfile.find(params[:id])
      end
    
      def update
        @emp_pro = EmployeeProfile.find(params[:id])
        if @emp_pro.update(emp_params)
          if @emp_pro.isrejected
            redirect_to employee_profiles_path
            else
          redirect_to employee_profiles_path
          end
        else
          render :edit, status: :unprocessable_entity
        end
      end
      def order_history
        @history=Cart.all
      end
    private
    def emp_params
      params.require(:employee_profile).permit(:name, :phone, :user_id, :company_id, :isapproved, :isrejected)
    end
end
