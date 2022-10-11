class ApplicationController < ActionController::Base
  before_action :set_current_user

  include ApplicationHelper
  include CartsHelper
  include NavigationHelper
  include ErrorMessagesHelper

  def set_current_user
    # finds user with session data and stores it if present
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    # allows only logged in user
    redirect_to sign_in_path, alert: 'You must be signed in' if Current.user.nil?
  end
    
  def admin_controls
    return redirect_to root_path, flash: { danger: "Access denied !!!" } if !(logged_in? && admin?) 
  end

  def employee_access
    return redirect_to root_path, flash: { danger: "Access denied !!!" } if !(logged_in? && employee? && validate_employee?) 
  end

  def chef_access
    return redirect_to root_path, flash: { danger: "Access denied !!!" } if !(logged_in? && chef? && validate_chef?) 
  end

  def customer_access
    return redirect_to root_path, flash: { danger: "Access denied !!!" } if !(logged_in? && customer? && validate_customer?) 
  end

  def cart_item_access
    return redirect_to root_path, flash: { danger: "Access denied !!!" } if !((logged_in? && customer? && validate_customer?) || (logged_in? && employee? && validate_employee?) || admin?) 
  end

  def order_status_access
    return redirect_to root_path, flash: { danger: "Access denied !!!" } if !((logged_in? && chef? && validate_chef?) || admin?)
  end

  def foodstore_access
    return redirect_to root_path, flash: { danger: "Access denied !!!" } if !((logged_in? && chef? && validate_chef?) || admin?)
  end
  
end
