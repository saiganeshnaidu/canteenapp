class RoomsController < ApplicationController
  before_action :validate_chef?
  before_action :validate_employee?

  def index
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

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path, status: :see_other
  end
  
  private
  
  def room_params
    params.require(:room).permit(:cart_id)
  end
end
