class GroupsController < ApplicationController
  def new
  end

  def create
    @group = Group.create(name: params[:name], group_id: params[:group_id])
    redirect_to "/groups/#{@group.group.id}/messages"
  end
end
