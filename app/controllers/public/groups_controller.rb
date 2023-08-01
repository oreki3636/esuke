class Public::GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    @user_ranks = @group.users.sort{|a,b| b.points.count <=> a.points.count}
    @group_user = @group.group_users.find_by(user_id: current_user.id)


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
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def update_one_word
    @group = Group.find(params[:group_id])
    @group_user = @group.group_users.find_by(user_id: current_user.id)

    unless @group_user.valid?
      p @group_user.errors.full_messages # ターミナルにエラーメッセージを表示
      @error_messages = @group_user.errors.full_messages
    end

    if @group_user.update({one_word: params[:one_word]})
      redirect_to group_path(@group)
    else
      @user_ranks = @group.users.sort{|a,b| b.points.count <=> a.points.count}
      @group_errors = @group.errors.full_messages
      render :show
    end
  end


  private
  def group_params
    params.require(:group).permit(:name,:introduction,:image,:one_word)
  end

end
