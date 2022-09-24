class MessagesController < ApplicationController
  def new
    @message=Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save    
  end

  def index 
    if Current.user && Current.user.usertype=="Employee"
      @roomid=Room.find(params[:roomid])
    elsif Current.user && Current.user.usertype=="Chef"
      @roomid=Room.find_by(params[:roomid])
    end
    @message=Message.new
    @messages=@roomid.messages
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end
  
  private
    def message_params
      params.require(:message).permit(:room_id, :context, :user_id)
    end
end
