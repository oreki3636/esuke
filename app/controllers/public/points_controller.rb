class Public::PointsController < ApplicationController
  def index
    @points = current_user.points.order(created_at: :desc)
    #orderメソッドに引数を複数渡すことで、先に渡した引数を優先的に並び替えるようにすることができる（create_at 作った順番）
    #descは降順。大きい物が先　ascは昇順。小さいものが先
  end
end
