class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      @child = @chatroom.child
      @users = @child.users.excluding(current_user)
      @users.each do |user|
        Notification.create(notifiable: @message, receiver: user, sender: current_user)
        # NotificationChannel.broadcast_to(
        #   user,
        # )
      end
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
