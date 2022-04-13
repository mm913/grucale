class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @group = Group.find(params[:group_id])
    @schedule = Schedule.find(params[:schedule_id]) 
    if @comment.save
      redirect_to group_schedule_path(@group.id, @schedule.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, schedule_id: params[:schedule_id], group_id: params[:group_id])
  end
end
