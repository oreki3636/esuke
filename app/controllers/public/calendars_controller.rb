class Public::CalendarsController < ApplicationController
  def new
    @calender=Calendar.new

  end
end
