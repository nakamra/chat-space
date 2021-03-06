class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def index
    @groups = current_user.groups
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "チャットグループが作成されました"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group.id), notice: "チャットグループが編集されました"
    else
      render "edit"
    end
  end

  private
  def group_params
    params.require(:group).permit(:name,  {user_ids: []})
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
