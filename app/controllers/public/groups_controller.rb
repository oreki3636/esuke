class Public::GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    @user_ranks = @group.users.sort{|a,b| b.points.count <=> a.points.count}
    #sort配列を変える
    #並べ替えの基準には <=> 演算子が使われており、数値の比較を行っている
    #{|a,b| a.points.count <=> b.points.count}の場合小さい順、{|a,b| b.points.count <=> a.points.count}は大きい順
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    group_user_ids = params[:group][:user_ids]
    if @group.save
      GroupUser.create(group_id: @group.id, user_id: @group.owner_id)
      group_user_ids.each do |user_id|
        GroupUser.create(group_id: @group.id, user_id: user_id)
      end
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name,:introduction,:image)
  end

end
