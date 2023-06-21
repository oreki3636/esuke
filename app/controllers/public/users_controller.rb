class Public::UsersController < ApplicationController

  def index
  end

  def show

  end

  def mypage
    @user=current_user

  end
    #Userpoint.group(:user_id)#まず、ユーザー情報の番号(note_id)が同じものにグループを分ける
    #order('count(point_id) desc')ポイントの多い順に並べる
    #limit(50)５０位まで表示
    #pluck(:user_id))ユーザー情報のみ数字で取り出す
    #User.find()#上記pluckで取り出された数字をUserのidとすることで訪問数順にユーザー情報を取得する。

  def edit
  end
end
