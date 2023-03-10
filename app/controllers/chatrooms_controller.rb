class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[show destroy]

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chat_params)
    @child = Child.find(params[:chatroom][:child_id])
    @chatroom.child_id = @child.id
    if @chatroom.save!
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  def destroy
    @chatroom.destroy
    redirect_to chatrooms_path
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chat_params
    params.require(:chatroom).permit(:name)
  end
end
