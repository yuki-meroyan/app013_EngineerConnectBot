class IntermediatesController < ApplicationController
  before_action :intermediate_params, only: [:create, :update]
  before_action :set_intermediate   , only: [:edit  , :update, :show]

  def index
    @intermediates = Intermediate.all
  end

  def new
    @intermediate = Intermediate.new
  end

  def create
    # entry_period = Date.new(intermediate_params["entry_period(1i)"].to_i, intermediate_params["entry_period(2i)"].to_i, intermediate_params["entry_period(3i)"].to_i)
    # work_period = Date.new(intermediate_params["work_period(1i)"].to_i, intermediate_params["work_period(2i)"].to_i, intermediate_params["work_period(3i)"].to_i)
    # @intermediate = Intermediate.new(
    #                                   title:          intermediate_params[:title],
    #                                   category:       intermediate_params[:category],
    #                                   language:       intermediate_params[:language],
    #                                   detail:         intermediate_params[:detail],
    #                                   entry_period:   entry_period,
    #                                   work_period:    work_period,
    #                                   recruit_member: intermediate_params[:recruit_member],
    #                                   user_id:        intermediate_params[:user_id]
    # )
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
    binding.pry
    # params.require(:intermediate).permit(:title, :category, :language, :detail, :entry_period, :work_period, :recruit_member).merge(user_id: current_user.id)
    params.require(:intermediate).permit(:title, :category, :language, :detail, :entry_period, :work_period, :recruit_member).merge(user_id: current_user.id)
  end

  def set_intermediate
    @intermediate = Intermediate.find_by(params[:id])
  end
end
