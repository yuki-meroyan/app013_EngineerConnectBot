class BeginnerCommentsController < ApplicationController
  before_action :comment_params, only: [:create]
  before_action :set_beginner  , only: [:create]

  def index
  end

  def create
    @comment = @beginner.beginner_comments.new(comment_params)
    if @comment.save
      redirect_to beginner_path(comment_params[:beginner_id]), notice: 'コメントしました'
      # respond_to do |format|
      #   format.html { redirect_to blogtext_path(comment_params[:blogtext_id]) }
      #   format.json
      # end
    else
      redirect_to beginner_path(comment_params[:beginner_id]), notice: "コメントを失敗しました"
    end
  end

  private
  def comment_params
    params.require(:beginner_comment).permit(:comment).merge(beginner_id: params[:beginner_id]).merge(user_id: current_user.id)
  end

  def set_beginner
    @beginner = Beginner.find(params[:beginner_id])
  end
end
