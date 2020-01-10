class UsersController < ApplicationController
  before_action :user_signed_check

  def index
    @user = User.ransack(params[:q])
    @users = @user.result(distinct: true).where('id != ?', current_user.id)
    # @users = @user.result(distinct: true).includes(:followers).where(followers: { id: @users })
    # binding.pry
    # @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users])
    # @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users]).includes(:followers)
    # @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users]).includes(:relationships)
    # @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users]).eager_load(:followers).where(followers: { id: current_user.id })
    # @relationships = Relationship.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users])
    # binding.pry
    # @myUserId = current_user.id
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  def show
    @user = User.find(params[:id])
    @following = current_user.following? @user
    @followable = @user.following? current_user
    # @follow = Follows.where('followable_id = ? and followed_id = ?', @user.id, current_user.id)
  end

  #フォローする
  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to Rails.application.routes.recognize_path(request.referer)
  end

  #フォローを外す
  def unfollow
      @user = User.find(params[:user_id])
      current_user.stop_following(@user)
      redirect_to Rails.application.routes.recognize_path(request.referer)
  end

  #フォローしてる人の一覧ページ & #フォロワーの一覧ページ
  def follow_list
    @user = User.find(params[:user_id])
    # binding.pry
  end

  # def followed
  #   @title = "フォロー"
  #   @user = User.find(params[:id])
  #   @users = @user.followeds
  #   render 'show_follow'
  # end

  # def followers
  #   @title = "フォロワー"
  #   @user = User.find(params[:id])
  #   @users = @user.followers
  #   render 'show_follower'
  # end

end