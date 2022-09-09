class CartsController < ApplicationController
    def new
      @cart=Cart.new
      @foodstore=Foodstore.find(params[:sid])
      
    end
    def create
        @cart = Cart.new(cart_params)
        
    
        if @cart.save
          redirect_to new_cart_list_path(:cid => @cart.id)
        else
          render :new, status: :unprocessable_entity
        end
      end
   def show
    @foodcategory = Foodcategory.find(params[:id])
    @foodstore=@foodcategory.foodstores
   end
   def index
    @foodcategories=Foodcategory.all
    @carts=Cart.all
   end
   def edit
    @cart=Cart.find(params[:id])
   end
   def update
    @cart = Cart.find(params[:id])

    if @cart.update(cart_params)
    else
      render :edit, status: :unprocessable_entity
    end
  end
   private
    def cart_params
      params.require(:cart).permit(:user_id, :foodstore_id, :order_status)
    end
end
