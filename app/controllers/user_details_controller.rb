class UserDetailsController < ApplicationController
  before_action :user_detail_params, only: [:create, :update]
  before_action :set_user_detail   , only: [:edit  , :update]

  def new
    @user_detail = UserDetail.new
  end

  def create
    @user_detail = UserDetail.new(user_detail_params)
    if @user_detail.save
      redirect_to root_path
    else
      render :show
    end
  end

  def show
    @user_detail = UserDetail.find_by(user_id: params[:id])
    unless @user_detail.present?
      redirect_to users_path, notice: '該当のユーザーは詳細の登録がありません'
    end

  end

  def edit

  end

  def update
    if @user_detail.update(user_detail_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_detail_params
    params.require(:user_detail).permit(:family_name, :first_name, :address, :level, :language, :detail).merge(user_id: current_user.id)
  end

  def set_user_detail
    @user_detail = UserDetail.find_by(user_id: current_user.id)
  end

end
