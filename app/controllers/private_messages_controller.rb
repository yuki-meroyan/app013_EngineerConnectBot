class PrivateMessagesController < ApplicationController
  before_action :set_private_message, except: [:create]

  def index
    @followers = current_user.followers
    @followeds = current_user.followeds
  end

  def new
    @message = PrivateMessage.new
    # @to_user = 送信相手のID
    @to_user = params[:send_user_id]
    # user_id = 送った本人のID / send_user_id = 送った相手のID
    @last_message = PrivateMessage.where(user_id: current_user.id, send_user_id: @to_user).or(PrivateMessage.where(user_id: @to_user, send_user_id: current_user.id)).last
  end

  def create
    # user_id = 自分のID / send_user_id = 送る相手のID
    @message = PrivateMessage.new(private_message_params)
    if @message.save
      redirect_to user_private_messages_path(current_user), notice: '送信が完了しました'
    else
      redirect_to new_user_private_message_path(user_id: private_message_params[:user_id], send_user_id: private_message_params[:send_user_id]), notice: "送信に失敗しました"
    end
  end


  def show
    @message = PrivateMessage.find_by(id: params[:id])
    # if @message.read_check == false && params[:user_id].to_i == @message.user.id
    if private_message_target[:target_box] == "受信"
      @message.update( read_check: true )
    else
    end
    @target_box = private_message_target[:target_box]
  end

  private

  def private_message_params
    params.permit(:text, :user_id, :send_user_id)
  end

  def private_message_target
    params.permit(:target_box)
  end

  def set_private_message
    # 受け取ったメッセージのリスト
    @messages = PrivateMessage.where(user_id: current_user.id).group(:send_user_id)
    # 送信したメッセージのリスト
    @send_messages = PrivateMessage.where(send_user_id: current_user.id).group(:user_id)
  end
end
