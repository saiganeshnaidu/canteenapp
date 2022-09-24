class SessionsController < ApplicationController

  def omniauth
    user=User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
      u.email=request.env['omniauth.auth'][:info][:email]
      u.password=SecureRandom.hex(15)
    end
    if user.save!
      session[:user_id]=user.id
      if !(user.usertype)
        redirect_to edit_registration_path(user)
      else
        define_path?
      end
    else
      redirect_to sign_in_path
    end
  end

  def new
    return redirect_to root_path, flash: { danger: "you are already logged in #{current_user.email}!!!" } if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])
    # finds existing user, checks to see if user can be authenticated
    if user.present? && user.authenticate(params[:password])
      # sets up user.id sessions
      session[:user_id] = user.id
      if admin?
        redirect_to admin_dashboard_path, flash: { success: "Logged in successfully" }
      else
        define_path?
      end
    else
      flash.now[:notice] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, flash: { success: "Logged out successfully" }
  end

  def define_path?
    if employee?
      redirect_to current_user.employee_profile, flash: { success: "Logged in successfully" }
    elsif chef?
      redirect_to current_user.chef_profile, flash: { success: "Logged in successfully" }
    elsif customer?
      redirect_to current_user.normal_customer, flash: { success: "Logged in successfully" }
    end
  end
end