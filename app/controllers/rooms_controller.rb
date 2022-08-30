class RoomsController < ApplicationController
  def index
    @room = Room.find(params[:id])

  end
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages

    render "index"
  end

  def new
    @room = Room.new
    @cartid=Cart.find(params[:cid])
  end

  def create
    @room = Room.new(room_params)


    if @room.save
      redirect_to @room
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  def room_params
    params.require(:room).permit(:cart_id)
  end
end
