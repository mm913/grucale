class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:index, :create]

  def index
    #@user = User.find(params[:user_id])
    #@groups = Group.all
    #@schedules = Group.find(params[:group_id]).schedule
    @schedules = Schedule.where(group_id: params[:group_id])
    #@schedules = Schedule.all
    @schedule = Schedule.new
    #@schedules = @group.schedules
    
  end

  #def new
   # @schedule = Schedule.new
  #end

  def create
    #binding.pry
    #@user = User.find(params[:user_id])
    #@schedule = Schedule.create(schedule_parameter) 
    @schedules = @group.schedule
    @schedule = current_user.schedules.new(schedule_parameter)
    @schedule_new = Schedule.new
    @schedule.group_id = @group.id
    
    #@schedule = Schedule.create(schedule_parameter)
    if @schedule.save    
      @schedule = Schedule.new
      redirect_to group_schedules_path(@group.id)
    else
      redirect_to root_path
    end
  end

  private

  def set_schedule
    #@schedule = Schedule.find(prams[:id])
    @group = Group.find(params[:group_id])
  end

  def schedule_parameter
    params.require(:schedule).permit(:title, :start_time, :finish_time, :all_day, :note)
    .merge(user_id: current_user.id, group_id: params[:group_id]) 
   # params[:group][:schedule] 
   # if params[:group] && params[:group][:schedule]
   #   .permit(:title, :start_time, :finish_time, :all_day, :note)
   #   .merge(user_id: current_user.id, group_id: params[:group_id])  
   # end
  end
end