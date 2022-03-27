class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.where(group_id: params[:group_id])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_parameter)
    if @schedule.save
      @schedule = Schedule(group_id: params[:group_id])
      redirect_to group_schedules_path(:group_id)
    else
      render 'new'
    end
  end

  private

  def schedule_parameter
    params.require(:schedule).permit(:title, :start_time, :finish_time, :note)
  end
end