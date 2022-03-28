class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.where(group_id: params[:group_id])
    @group = Group.find(params[:group_id])
  end

  def new
    #@group = Group.find(params[:group_id])
    @schedule = Schedule.new
  end

  def create
    #binding.pry
    @schedule = Schedule.new(schedule_parameter)
    if @schedule.save
      redirect_to group_schedules_path     
    else
      rendar 'new'
    end
  end

  private

  def schedule_parameter
    params.require(:schedule).permit(:title, :start_time, :finish_time, :all_day, :note, :user_id, :group_id)
  end
end