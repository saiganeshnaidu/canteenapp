module ApplicationHelper
  include CartsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    
  def logged_in?
    !!current_user
  end

  def role
    @role ||= User.find(session[:user_id]).usertype if logged_in?
  end

  def admin?
    @is_admin ||= (role=="Admin") if logged_in?
  end

  def employee?
    @is_employee ||= (role=="Employee") if logged_in?
  end

  def chef?
    @is_chef ||= (role=="Chef") if logged_in?
  end

  def customer?
    @is_customer ||= (role=="Ordinary people") if logged_in?
  end    
end
