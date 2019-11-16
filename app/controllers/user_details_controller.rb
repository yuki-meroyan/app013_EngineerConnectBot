class UserDetailsController < ApplicationController
  before_action :user_detail_params, only: [:create, :update]

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
  end

  def edit
  end

  def update
    @user_detail = UserDetail.find_by()
  end

  private
  def user_detail_params
    params.require(:user_detail).permit(:family_name, :first_name, :address, :level, :language, :detail).merge(user_id: current_user.id)
  end

end
