class Public::GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end
end
