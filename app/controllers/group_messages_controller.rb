class GroupMessagesController < ApplicationController
  before_action :set_group

  def index
    @group_message = GroupMessage.new
    @group_messages = @group.group_messages.includes(:user)
  end

  def create
    @group_message = @group.group_messages.new(group_message_params)
    if @group_message.save
      respond_to do |format|
        format.html { redirect_to group_group_messages_path(@group), notice: "メッセージが送信されました"  }
        format.json
      end

    else
      @group_messages = @group.group_messages.includes(:user)
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def group_message_params
    params.require(:group_message).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
