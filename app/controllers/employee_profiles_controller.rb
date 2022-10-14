class EmployeeProfilesController < ApplicationController
  before_action :admin?, only: [:edit, :update]
  before_action :employee?, only: [:show]
  before_action :employee_access, only: [ :noticee]

  def new
    @emp_pro=EmployeeProfile.new
    @company=Company.all
  end

  def show
    @heading="Employee Dashboard"
  end

  def create
    @emp_pro = EmployeeProfile.new(emp_params)
    if @emp_pro.save
      redirect_to @emp_pro
    else
      render :new, status: :unprocessable_entity
    end    
  end

  def destroy
    @emp_pro = EmployeeProfile.find(params[:id])
    @emp_pro.destroy
    redirect_to root_path, status: :see_other
  end

  def update
    @emp_pro = EmployeeProfile.find(params[:id])
    if @emp_pro.update(emp_params)
      redirect_to approvals_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def order_history
    if validate_customer? || validate_employee?
      @history=Cart.myorder
    else
      return redirect_to root_path, flash: { danger: "Access denied" } 
    end
    @room=Room.new
    @total=0
  end

  def noticee
  end

  def destroy
    @employee = EmployeeProfile.find(params[:id])
    @employee.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def emp_params
    params.require(:employee_profile).permit(:name, :phone, :user_id, :company_id, :isapproved, :isrejected)
  end
end
