class SchedulesController < ApplicationController
  before_action :set_group, only: [:index, :create, :show, :edit, :update, :destroy]
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  

  def index
    @schedules = Schedule.where(group_id: params[:group_id]).order("start_time ASC")
    @schedule = Schedule.new  
  end

  def create 
    @schedules = @group.schedule
    @schedule = current_user.schedules.new(schedule_parameter)
    @schedule_new = Schedule.new
    @schedule.group_id = @group.id   
    #スケジュールの保存
    @schedule.save    
    @schedule = Schedule.new
    redirect_to group_schedules_path(@group.id)
  end

  def show
    @comments = @schedule.comments.includes(:user)
    @comment = Comment.new
  end

  def edit 
  end

  def update     
    if @schedule.update(schedule_parameter)
      redirect_to group_schedule_path
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to group_schedules_path(@group.id)
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id]) 
  end

  def schedule_parameter
    params.require(:schedule).permit(:title, :start_time, :finish_time, :all_day, :note)
    .merge(user_id: current_user.id, group_id: params[:group_id]) 
  end
end