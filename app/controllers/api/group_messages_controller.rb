class Api::GroupMessagesController < ApplicationController
  def index
    @group_messages = GroupMessage.includes(:user).where('id > ? ', params[:id]).where(group_id: params[:group_id]);
  end
end