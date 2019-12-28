class UsersController < ApplicationController

  def index
    # binding.pry
    # @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users])
    # @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users]).includes(:followers)
    # @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users]).includes(:relationships)
    @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users]).eager_load(:followers).where(followers: { id: current_user.id })
    # @relationships = Relationship.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users])
    binding.pry
    # @myUserId = current_user.id
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @user = User.find(params[:id])
    @follow = Relationship.where('follower_id = ? and followed_id = ?', @user.id, current_user.id)
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