class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    #@group = Group.find(params[:group_id])
    #@schedule = Schedule.find(params[:schedule_id])
    if @comment.save
      @time = @comment.created_at.strftime('%m月%d日 %H:%M')
      @image = @comment.user.image
      #CommentChannel.broadcast_to @schedule, { comment: @comment, user: @comment.user.id }
      ActionCable.server.broadcast "comment_channel", {comment: @comment, user: @comment.user, time: @time, image: @image} 
      #redirect_to group_schedule_path(@group.id, @schedule.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, schedule_id: params[:schedule_id], group_id: params[:group_id])
  end
end
