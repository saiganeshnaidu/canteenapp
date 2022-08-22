class CartListsController < ApplicationController
    def new
        @cartlist=CartList.new
          @cartid=Cart.find(params[:cid])
          @foodstore=Foodstore.find_by(id: @cartid[:foodstore_id])
      end
      def create
          @cartlist = CartList.new(list_params)
        
    
          if @cartlist.save
            redirect_to new_cart_list_path
          else
            render :new, status: :unprocessable_entity
          end
      end
      def index
        @cartid=Cart.find(params[:cid])

      end
      
      private
      def list_params
          params.require(:cart_list).permit(:cart_id, :fooditem_id, :quantity, :description)
      end
end
