class CartListsController < ApplicationController
  before_action :logged_in?
  before_action :cart_list_access
  
  def new
    @cartlist=CartList.new
    @cartid=Cart.find(params[:cid])
    @foodstore=Foodstore.find_by(id: @cartid[:foodstore_id])
  end

  def create
    @cartlist = CartList.new(list_params)
    if @cartlist.save
      redirect_to new_cart_list_path, flash: { success: "Ited added to cart" }
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

    def list_params
      params.require(:cart_list).permit(:cart_id, :fooditem_id, :quantity, :description)
    end
end
