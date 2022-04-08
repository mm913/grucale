class GroupsController < ApplicationController
  
  def index
  end

  def new
    @group = Group.new
    #@group.schedule.build
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
    @group = Group.find(params[:id])
    @group.users << current_user
    @group.save
    #カレンダー機能実装後、下記を変更
    redirect_to root_path
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.users.delete(current_user)
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:group_name, :note, {user_id: []} )
  end
end
