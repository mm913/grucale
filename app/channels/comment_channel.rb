class CommentChannel < ApplicationCable::Channel
  def subscribed
    #binding.pry
    #@group = Group.find(params[:group_id])
    #@schedule = Schedule.find(params[:schedule_id])
    #stream_for @schedule
    stream_from "comment_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
