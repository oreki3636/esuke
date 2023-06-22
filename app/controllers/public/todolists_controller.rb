class Public::TodolistsController < ApplicationController

  def new
    @todolist=Todolist.new
  end

  def create
    @todolist=Todolist.new
    @todolist.save
    redirect_to user_mypage_path
  end
end
