class Admin::StatisticController < ApplicationController
  layout "admin"

  # get /admin/statistic
  def index

    @question_rating = Question.select('user_id, sum(rating) as rating').group(:user_id)
  end
end
