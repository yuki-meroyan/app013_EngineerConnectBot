class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @group = Group.ransack(params[:q])
    @groups = @group.result(distinct: true).includes(:users)
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      # flash[:notice] = "グループを作成しました"
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to engineer_connect_bots_have_group_path(current_user.id), notice: 'グループを編集しました'
    else
      render :edit
    end
  end

  protected

  def group_params
    params.require(:group).permit(:name, :master, :master_name, :detail, { user_ids: [] } )
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
