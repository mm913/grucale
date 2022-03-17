class GroupsController < ApplicationController

  def new
    @group = Group.new
     #@group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      #binding.pry
      @group.users = [current_user]
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def group_params
    params.require(:group).permit(:group_name, :note, {user_id: []} )
  end
end
