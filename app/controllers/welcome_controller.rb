class WelcomeController < ApplicationController
  before_action :admin_controls, only: [:approval, :admin_notice, :admin_dashboard]

  def index
  end

  def admin_notice
  end

  def approval
    @emp_pros=EmployeeProfile.all
    @chef_pros=Chefprofile.all
    @customers=NormalCustomer.all
  end

  def admin_dashboard
    @heading="Admin Dashboard"
  end
  
end
