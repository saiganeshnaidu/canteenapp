class CustomersController < ApplicationController
  before_action :admin?, only: [:edit, :update]
  before_action :customer?, only: [:show]
  before_action :customer_access, only: [:customer_notice]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
    respond_to do |format|
      format.xlsx
    end
  end

  def edit
    @customer = EmployeeProfile.find(params[:id])
  end
    
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to approvals_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @heading="Customer Dashboard"
    @customer=Customer.find(params[:id])
  end

  def customer_notice
  end

  private
  
  def customer_params
    params.require(:customer).permit(:name, :phone, :user_id, :isapproved, :isrejected)
  end
end
