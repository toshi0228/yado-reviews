class CommentsController < ApplicationController
  
  
  def create
    @comment = Comment.create(text: comment_params[:text], yado_id: comment_params[:top_id], user_id: current_user.id)
    redirect_to "/tops/#{@comment.yado.id}"
  end
  
  private
  def comment_params
    params.permit(:text, :top_id)
  end
end
