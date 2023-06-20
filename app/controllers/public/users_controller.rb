class Public::UsersController < ApplicationController

  def index
  end

  def show

  end

  def mypage
    @user=current_user

  end

  def edit
  end
end
