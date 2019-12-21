class PrivateMessagesController < ApplicationController

  def index
    @followers = Relationship.where(follower_id: current_user.id)
    @followeds = User.where(id: @followers.ids)
    @from_messages = PrivateMessage.where(user_id: current_user.id)
    @to_messages = PrivateMessage.where(send_user_id: current_user.id)
  end

  def new
    @private_message = PrivateMessage.new
  end

  def create
    @private_message = current_user.private_messages.new(private_message_params)
  end

  def private_message_params
    params.require(:private_message).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_private
    @private = Group.find(params[:private_id])
  end
end
