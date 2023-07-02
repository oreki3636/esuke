class Public::TodolistsController < ApplicationController


  def new
    @todolist=Todolist.new
  end

  def show
    @todolists = Todolist.where(user_id: current_user.id, date: params[:id])
    #id以外のカラムの検索条件で、複数の実行結果を取得したい場合・・・where
    #dateは日付が入ってIDになっている
  end

  def update
    todo = Todolist.find(params[:id])
    todo.update(check: true, completed_datetime: Time.now)
    todo.points.create(user_id: current_user.id)
    todo.points.update_all(done_flg: true)
    redirect_to todolist_path(todo.date)
  end

  def create
    @todolist = Todolist.new(todolist_params)
    if @todolist.save
      @todolist.points.create(user_id: current_user.id, done_flg: false)
      redirect_to mypage_path, notice: '登録に成功'
    else
      redirect_to mypage_path
    end
  end

  def destroy
    todo = Todolist.find(params[:id])
    todo.destroy
    redirect_to todolist_path(todo.date)
  end


  private

  def todolist_params
    params.require(:todolist).permit(:list, :date)
          .merge(
            date: Date.current.in_time_zone('Tokyo') + 1.days,
            user_id: current_user.id
          )
  end
end
