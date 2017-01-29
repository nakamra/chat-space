class MessagesController < ApplicationController
  before_action :set_group, :set_groups, :set_messages
  def index
    @message = current_user.messages.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

 private

  def message_params
   params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_groups
    @groups = current_user.groups
  end

  def set_messages
    @messages = @group.messages.includes(:user)
  end
end
