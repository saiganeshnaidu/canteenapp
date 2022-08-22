class SessionsController < ApplicationController
    def new; end
    def create
      user = User.find_by(email: params[:email])
      # finds existing user, checks to see if user can be authenticated
      if user.present? && user.authenticate(params[:password])
      # sets up user.id sessions
        session[:user_id] = user.id
        if user.usertype=="Employee"
        @emp_pro=EmployeeProfile.find_by(user_id: user[:id])
        redirect_to @emp_pro
        elsif user.usertype=="Chef"
          @chef_pro=Chefprofile.find_by(user_id: user[:id])
          redirect_to @chef_pro
        else
          redirect_to root_path
        end
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
    def destroy
      # deletes user session
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end
  end