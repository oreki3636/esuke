class Public::UsersController < ApplicationController

  def show
    @user = user.find(params[:id])

  end



  def edit
    @user = current_user
  end

  def update
    @user=current_user
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def mypage
    @user = current_user
    @todolists = @user.todolists
    @todo = Todolist.new
    @all_ranks = User.find(Point.group(:user_id).order('count(user_id) desc').limit(3).pluck(:user_id))
    # byebug


  end
    #Userpoint.group(:user_id)#まず、ユーザー情報の番号(note_id)が同じものにグループを分ける
    #order('count(point_id) desc')ポイントの多い順に並べる
    #limit(50)５０位まで表示
    #pluck(:user_id))ユーザー情報のみ数字で取り出す
    #User.find()#上記pluckで取り出された数字をUserのidとすることで訪問数順にユーザー情報を取得する。

  def unsubscribe
    @user=current_user
  end

  def withdraw
    @user=current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path

  end

  protected
  def user_params
    params.require(:user).permit(:name,:introduction,:email,:telephone_number,:profile_image)
  end
end
