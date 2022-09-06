class ChatroomsController < ApplicationController
  def index
    @chatrooms = current_user.chatrooms.distinct
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    current_user.unread_messages.each do |message|
      message.update(read: true)
    end
  end

  def create
    @chatroom = Chatroom.new()
    if @chatroom.save
      Message.create!(user_id: current_user.id, chatroom_id: @chatroom.id)
      Message.create!(user_id: params[:other_user_id], chatroom_id: @chatroom.id)
      redirect_to chatroom_path(@chatroom)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
