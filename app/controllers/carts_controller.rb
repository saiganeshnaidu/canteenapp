class CartsController < ApplicationController
  before_action :validate_employee?, only: [:new, :show]
  before_action :validate_customer?, only: [:new, :show, :edit]
  before_action :order_status_access, only: [:edit]
  
  def new
    @foodstore=FoodStore.find(params[:sid])
    @cart=Cart.new

  end

  def create
    @cart = Cart.new(cart_params)    
    if @cart.save
      redirect_to new_cart_item_path(:cid => @cart.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @foodcategory = FoodCategory.find(params[:id])
    @foodstore=@foodcategory.food_stores
  end

  def index
    @foodcategories=FoodCategory.all
    @carts=Cart.all
  end

  def edit
    @cart=Cart.find(params[:id])
    @total=0
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      if admin?
        redirect_to carts_path, flash: { success: "Order status updated" }
      elsif chef?
        redirect_to order_path, flash: { success: "Order status updated" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id, :food_store_id, :order_status)
  end
end
