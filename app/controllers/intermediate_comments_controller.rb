class IntermediateCommentsController < ApplicationController
  before_action :user_signed_check, only: [:create]
  before_action :comment_params   , only: [:create]
  before_action :set_intermediate , only: [:create]

  def index
  end

  def create
    @comment = @intermediate.intermediate_comments.new(comment_params)
    if @comment.save
      redirect_to intermediate_path(comment_params[:intermediate_id]), notice: 'コメントしました'
    else
      redirect_to intermediate_path(comment_params[:intermediate_id]), notice: "コメントを失敗しました"
    end
  end

  private
  def comment_params
    params.require(:intermediate_comment).permit(:comment).merge(intermediate_id: params[:intermediate_id]).merge(user_id: current_user.id)
  end

  def set_intermediate
    @intermediate = Beginner.find(params[:intermediate_id])
  end
end
