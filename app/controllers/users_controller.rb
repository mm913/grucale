class UsersController < ApplicationController
  
  def toppage   
  end
  
  def show
    @user = User.find(params[:id])
    @schedules = Schedule.where(group_id: current_user.groups.ids).order("start_time ASC")
    #@schedules = Schedule.joins(group: users).where("user.id?", @user.id)
    #@schedules = Schedule.where(group_id: params[:current_user_group_id]).(schedule_id: params[:current_user_group_schedule_id]).order("start_time ASC")
    #@group = Group.find(params[:id])
    #@schedule = Schedule.where
    #@schedule = Schedule.find(params[:schedule_id])
    #@schedules = Schedule.all && current_user.groups == @schedule.group
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:department_name, :image)
  end

end
