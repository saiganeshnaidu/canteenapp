class RegistrationsController < ApplicationController
    # instantiates new user
    def new
      @user = User.new
    end
    def create
      @user = User.new(user_params)
      if @user.save
      # stores saved user id in a session
        session[:user_id] = @user.id
        if (@user.usertype=="Employee")
        redirect_to new_employee_profile_path, notice: 'Successfully created account'
        elsif (@user.usertype=="Chef")
          redirect_to new_chefprofile_path, notice: 'Successfully created account'

        else
          redirect_to root_path, notice: 'Successfully created account'
        end
      else
        render :new
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