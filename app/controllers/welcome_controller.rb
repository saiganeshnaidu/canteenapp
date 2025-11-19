class WelcomeController < ApplicationController
  before_action :admin_controls, only: [:approval, :admin_notice, :admin_dashboard]
  protect_from_forgery except: :global_search


  def index
  end

  def admin_notice
  end

  def global_search
    @search_results = Elasticsearch::Model.search(
      {
        query: {
          multi_match: {
            query: params[:q],
            fields: ['name', 'email']
          }
        }
      },
      [User, FoodItem]
    )

    @records = @search_results.records.to_a

    respond_to do |format|
      format.html # Handles regular HTML requests
      format.js   # Handles AJAX requests
    end
  end


  def approval
    # This will check if employee_profiles key exists in redis cache if not then it will execute code inside the block
    @emp_pros = Rails.cache.fetch("employee_profiles", expires_in: 10.minutes) do
      EmployeeProfile.all
    end

    # @emp_pros=EmployeeProfile.all
    @chef_pros=ChefProfile.all
    @customers=Customer.all
  end

  def admin_dashboard
    @users = User.all
    @heading="Admin Dashboard"
  end
  
end
