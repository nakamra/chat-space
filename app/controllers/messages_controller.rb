class MessagesController < ApplicationController
  before_action :set_messages, only: [:index,:create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

 private

 def message_params
   params.require(:message).permit(:body).merge(group_id: params[:group_id],user_id: current_user.id)
 end

 def set_messages
   @messages = Message.includes(:user, :group)
   @group = Group.find(params[:group_id])
   @groups = current_user.groups
 end
end
