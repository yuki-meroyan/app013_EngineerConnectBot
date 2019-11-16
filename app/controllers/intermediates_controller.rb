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
    @intermediate = Intermediate.new(
                                      title:          params[:intermediate][:title],
                                      category:       params[:intermediate][:category],
                                      language:       params[:intermediate][:language],
                                      detail:         params[:intermediate][:detail],
                                      entry_period:   entry_period,
                                      work_period:    work_period,
                                      recruit_member: params[:intermediate][:recruit_member]
    )
    binding.pry
    if @intermediate.save
      redirect_to root_path
    else
      render :show
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
    entry_period = Date.new(params[:intermediate]["entry_period(1i)"].to_i, params[:intermediate]["entry_period(2i)"].to_i, params[:intermediate]["entry_period(3i)"].to_i)
    work_period = Date.new(params[:intermediate]["work_period(1i)"].to_i, params[:intermediate]["work_period(2i)"].to_i, params[:intermediate]["work_period(3i)"].to_i)
    params.require(:intermediate).permit(:title, :category, :language, :detail, :entry_period, :work_period, :recruit_member).merge(user_id: current_user.id)
  end

  def set_intermediate
    @intermediate = Intermediate.find_by(params[:id])
  end
end
