class UsersController < ApplicationController

  def index
    # @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id).where.not(id: params[:selected_users])
    @users = User.where('name LIKE(?) and id != ?', "%#{params[:keyword]}%", current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

end