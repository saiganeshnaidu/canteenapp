class CartItemsController < ApplicationController
  before_action :logged_in?
  before_action :cart_item_access
  
  def new
    @cartitem=CartItem.new
    @cartid=Cart.find(params[:cid])
    @foodstore=FoodStore.find_by(id: @cartid[:food_store_id])
  end

  def create
    @cartitem = CartItem.new(cart_item_params)
    if @cartitem.save
      redirect_to new_cart_item_path, flash: { success: "Ited added to cart" }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @cartid=Cart.find(params[:cid])
    @room=Room.new
    @total=0
  end
     
  private

    def cart_item_params
      params.require(:cart_item).permit(:cart_id, :food_item_id, :quantity, :description)
    end
end
