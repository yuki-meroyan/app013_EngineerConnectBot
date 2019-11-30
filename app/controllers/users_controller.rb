class UsersController < ApplicationController

  def index
    # @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users])
    @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def followed
    @title = "フォロー"
    @user = User.find(params[:id])
    @users = @user.followeds
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

end