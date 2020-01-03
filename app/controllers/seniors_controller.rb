class SeniorsController < ApplicationController
  before_action :user_signed_check, only: [:new   , :update, :create]
  before_action :senior_params    , only: [:create, :update]
  before_action :set_senior       , only: [:edit  , :update, :show]

  def index
    @senior = Senior.ransack(params[:x], search_key: :x)
    @seniors = @senior.result(distinct: true)
  end

  def new
    @senior = Senior.new
  end

  def create
    @senior = Senior.new(senior_params)
    if @senior.save
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
    if @senior.update(senior_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def senior_params
    params.require(:senior).permit(:title, :category, :language, :detail, :price, :entry_period, :work_period).merge(user_id: current_user.id)
  end

  def set_senior
    @senior = Senior.find_by(params[:id])
  end
end
