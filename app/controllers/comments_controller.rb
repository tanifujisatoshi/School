class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to lunch_path(@comment.lunch)
    else
      @lunch = @comment.lunch
      @comments = @lunch.comments
      render 'lunches/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, lunch_id: params[:lunch_id])
  end
end
