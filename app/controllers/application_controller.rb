class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :set_emp
    def set_current_user
      # finds user with session data and stores it if present
      Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end
    def set_emp
      @cur_emp=EmployeeProfile.find_by(user_id: session[:user_id]) if Current.user && Current.user.usertype=="Employee"
    end

    def require_user_logged_in!
      # allows only logged in user
      redirect_to sign_in_path, alert: 'You must be signed in' if Current.user.nil?
    end
end
