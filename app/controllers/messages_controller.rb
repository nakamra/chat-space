class MessagesController < ApplicationController
  before_action :set_variables

  def index
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to group_messages_path }
        format.json { render "message", handlers: :jbuilder }
      else
        format.html { render :index }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
   params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

  def set_variables
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @messages = @group.messages.includes(:user)
  end
end
