# frozen_string_literal: true

module Admin
  class HomesController < ApplicationController
    def top
      @users = User.all
    end
  end
end
