class SeniorCommentsController < ApplicationController
  before_action :user_signed_check, only: [:create]
  before_action :comment_params   , only: [:create]
  before_action :set_senior       , only: [:create]

  def index
  end

  def create
    @comment = @senior.senior_comments.new(comment_params)
    if @comment.save
      redirect_to senior_path(comment_params[:senior_id]), notice: 'コメントしました'
    else
      redirect_to senior_path(comment_params[:senior_id]), notice: "コメントを失敗しました"
    end
  end

  private
  def comment_params
    params.require(:senior_comment).permit(:comment).merge(senior_id: params[:senior_id]).merge(user_id: current_user.id)
  end

  def set_senior
    @senior = Beginner.find(params[:senior_id])
  end
end
