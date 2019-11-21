class IntermediatesController < ApplicationController
  before_action :intermediate_params, only: [:create, :update]
  before_action :set_intermediate   , only: [:edit  , :update, :show]

  def index
    @intermediate = Intermediate.ransack(params[:p], search_key: :p)
    @intermediates = @intermediate.result(distinct: true)
  end

  def new
    @intermediate = Intermediate.new
  end

  def create
    @intermediate = Intermediate.new(intermediate_params)
    if @intermediate.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show

  end

  def edit

  end

  def update
    if @intermediate.update(intermediate_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def intermediate_params
    params.require(:intermediate).permit(:title, :category, :language, :detail, :entry_period, :work_period, :recruit_member).merge(user_id: current_user.id)
  end

  def set_intermediate
    @intermediate = Intermediate.find_by(params[:id])
  end
end
