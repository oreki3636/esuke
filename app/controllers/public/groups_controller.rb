class Public::GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    # @user_ranks = User.find(Point.group(:user_id).order('count(user_id) desc').limit(30).pluck(:user_id))
    # @group_ranks = @user_ranks.select{|user|user.group.id == params[:id]}
    @user_ranks = @group.users.sort{|a,b| a.points.count <=> b.points.count}
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
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
