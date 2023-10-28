# frozen_string_literal: true
  class Admin::HomesController < ApplicationController
    def top
      @users = User.all
    end
  end