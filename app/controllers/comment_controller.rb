class CommentController < ApplicationController
  def create
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, lunch_id: params[:lunch_id])
  end


end
