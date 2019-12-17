class BeginnersController < ApplicationController
  before_action :beginner_params, only: [:create, :update]
  before_action :set_beginner   , only: [:edit  , :update, :show]

  def index
    @beginner = Beginner.ransack(params[:q])
    @beginners = @beginner.result(distinct: true)
  end

  def new
    @beginner = Beginner.new
  end

  def create
    @beginner = Beginner.new(beginner_params)
    if @beginner.save
      redirect_to root_path
    else
      render :show
    end
  end

  def show
    @comment = BeginnerComment.new
    @comments = @beginner.beginner_comments.includes(:user)
  end

  def edit

  end

  def update
    if @beginner.update(beginner_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def beginner_params
    params.require(:beginner).permit(:title, :category, :language, :detail).merge(user_id: current_user.id)
  end

  def set_beginner
    @beginner = Beginner.find_by(params[:id])
  end
end
