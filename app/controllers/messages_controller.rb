class MessagesController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.includes(:user)
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
  end

  def create
    if Message.create(message_params)
      redirect_to group_messages_path
    else
      flash.now[:alert] = "メッセージを入力してください"
      render "index"
    end
  end

 private

 def message_params
   params.require(:message).permit(:body).merge(group_id: params[:group_id],user_id: current_user.id)
 end
end
