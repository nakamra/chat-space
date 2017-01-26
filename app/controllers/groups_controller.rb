class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @groups = current_user.groups
  end

  def create
    @group = Group.new(group_params)
    if @group.name.present? && @group.user_ids.present?
      @group.save
      redirect_to root_path, notice: "チャットグループが作成されました"
    elsif @group.name.present?
      flash[:alert] = "ユーザーを選択してください"
      render "new"
    else
      flash[:alert] = "グループ名を入力してください"
      render "new"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name,  {user_ids: []})
  end
end
