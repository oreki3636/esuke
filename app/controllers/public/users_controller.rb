# frozen_string_literal: true
  class Public::UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = current_user
    end

    def update
      @user = current_user
      if @user.update(user_params)
        redirect_to mypage_path
      else
        render :edit
      end
    end

    def mypage
      @user = current_user
      @users = User.all
      @todolists = @user.todolists
      @todo = Todolist.new
      @index_plus = (params[:page].present? ? (params[:page].to_i - 1) * per : 0) + 1
      @all_ranks = @users.sort { |a, b| a.points.count <=> b.points.count }.reverse
      # @all_ranks = User.where(id: ranking_user_ids).order(points_count: :desc)
      # ranking_user_ids = Point.group(:user_id).order('count(user_id) desc').limit(30).pluck(:user_id)
      # User.find([4,2,3])
    end

    # point.group(:user_id)#まず、ユーザー情報の番号(user_id)が同じものにグループを分ける
    # order('count(user_id) desc')ポイントの多い順に並べる
    # limit(50)位まで表示
    # pluck(:user_id))ユーザー情報のみ数字で取り出す
    # User.find()#上記pluckで取り出された数字をUserのidとすることで訪問数順にユーザー情報を取得する。

    def unsubscribe
      @user = current_user
    end

    def withdraw
      @user = current_user
      @user.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end

    protected

    def user_params
      params.require(:user).permit(:name, :introduction, :email, :telephone_number, :profile_image)
    end
  end
