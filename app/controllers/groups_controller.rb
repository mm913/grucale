class GroupsController < ApplicationController
  before_action :set_group, only: [:join, :show, :destroy]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.users = [current_user]
      redirect_to root_path
    else
      render 'new'
    end
  end

  def search
    @groups = Group.search(params[:keyword])
  end

  def join
    @group.users << current_user
    @group.save
    redirect_to root_path
  end

  def show
  end

  def destroy  
    @group.users.delete(current_user)
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:group_name, :note, {user_id: []} )
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
