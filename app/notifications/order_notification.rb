# To deliver this notification:
#
# OrderNotification.with(post: @post).deliver_later(current_user)
# OrderNotification.with(post: @post).deliver(current_user)

class OrderNotification < Noticed::Base
  # Add your delivery methods
  #
   deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
   #def message
    #@cart=Cart.find_by(params[:id])
    #@user=User.find(@cart.user_id)
    #"#{@user.email} has placed order"
  #end
  #
   #def url
    #edit_cart_path(Cart.find_by(params[:id]))
   #end
end
