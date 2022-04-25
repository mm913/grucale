class UsersController < ApplicationController
  before_action :set_user, except: :toppage
  before_action :move_to_toppage, only: :show

  def toppage   
  end
  
  def show
    
    @schedules = Schedule.where(group_id: current_user.groups.ids).order("start_time ASC")
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

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_toppage
    if user_signed_in? && current_user.id != @user.id
      redirect_to root_path
    end
  end

end
