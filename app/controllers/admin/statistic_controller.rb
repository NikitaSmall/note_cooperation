class Admin::StatisticController < ApplicationController
  layout "admin"

  # get /admin/statistic
  def index
    @hello = 'Привет!'
  end
end
