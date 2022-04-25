class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @time = @comment.created_at.strftime('%Y年%m月%d日 %H:%M')
      @image = @comment.user.image
      ActionCable.server.broadcast "comment_channel", {comment: @comment, user: @comment.user, time: @time, image: @image} 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, schedule_id: params[:schedule_id], group_id: params[:group_id])
  end
end
