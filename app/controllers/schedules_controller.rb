class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.where(group_id: params[:group_id])
  end

  def new
    #@group = Group.find(params[:group_id])
    @schedule = Schedule.new
  end

  def create
    Schedule.create(schedule_parameter)
    redirect_to group_schedules_path
  end

  private

  def schedule_parameter
    params.require(:schedule).permit(:title, :start_time, :finish_time, :note).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end