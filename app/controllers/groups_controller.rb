class GroupsController < ApplicationController
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
        redirect_to new_group_path, alert: "グループ名を入力してください"
      end
  end


  private

    def group_params
      params.require(:group).permit(:name,  {user_ids: []})
    end
end
