class WelcomeController < ApplicationController
  def index
    if Current.user
      if Current.user.usertype=="Employee"
        @emp_pro=EmployeeProfile.find_by(user_id: Current.user.id)
      elsif Current.user.usertype=="Chef"
      @chef_pro=Chefprofile.find_by(user_id: Current.user.id)


      end
    end
  end
end
