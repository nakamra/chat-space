class GroupsController < ApplicationController
  def new
    @group = Group.new
    @users = User.where.not(id: current_user.id)
  end

  def index
    @groups = current_user.groups
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    if @group.save
      redirect_to root_path, notice: "チャットグループが作成されました"
    else
      @users = User.where.not(id: current_user.id)
      render "new"
    end
  end

  def edit
    @group = Group.new
    @users = User.where.not(id: current_user.id)
  end

  private

  def group_params
    params.require(:group).permit(:name,  {user_ids: []})
  end
end
