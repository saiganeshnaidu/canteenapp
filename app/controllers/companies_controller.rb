class CompaniesController < ApplicationController
  # checks whether current user is admin or not
  before_action :admin_controls

  def index
    @company = Company.new
    @companies=Company.all
  end

  def show
    @companies_item = Company.find(params[:id])
  end

  def new
    @companies = Company.new
  end

  def create
    @companies = Company.new(company_params)
    if @companies.save
      redirect_to @companies
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @companies = Company.find(params[:id])
  end

  def update
    @companies = Company.find(params[:id])
    if @companies.update(company_params)
      redirect_to @companies
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @companies = Company.find(params[:id])
    @companies.destroy
    redirect_to companies_path, status: :see_other
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end

