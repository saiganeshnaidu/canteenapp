class MessagesController < ApplicationController
    def new
        @message=Message.new
    end
    def create
        @message = Message.new(message_params)
        
    
        if @message.save
        else
          render :new, status: :unprocessable_entity
        end
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
      private
      def message_params
        params.require(:message).permit(:room_id, :context)
      end
end
