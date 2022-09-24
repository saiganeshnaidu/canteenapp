class RegistrationsController < ApplicationController
  # instantiates new user
  def new
    return redirect_to root_path, flash: { danger: "you are already logged in #{current_user.email}!!!" } if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # stores saved user id in a session
      session[:user_id] = @user.id
      if employee?
        redirect_to employee_detail_path, notice: 'Successfully created account'
      elsif chef?
        redirect_to chef_detail_path, notice: 'Successfully created account'
      elsif customer?
        redirect_to customer_detail_path, notice: 'Successfully created account'
      elsif
        redirect_to admin_dashboard_path, notice: 'Successfully created account'
      end
    else
      render :new
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if employee?
        redirect_to employee_detail_path, notice: 'Successfully created account'
      elsif chef?
        redirect_to chef_detail_path, notice: 'Successfully created account'
      elsif customer?
        redirect_to customer_detail_path, notice: 'Successfully created account'
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, status: :see_other
  end

  private
    def user_params
      # strong parameters
      params.require(:user).permit(:email, :password, :password_confirmation, :usertype)
    end
end