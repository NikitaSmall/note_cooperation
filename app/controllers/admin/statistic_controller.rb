class Admin::StatisticController < ApplicationController
  layout "admin"

  before_filter :authenticate

  # get /admin/statistic
  def index

    @question_rating = Question.select('user_id, sum(rating) as rating').group(:user_id)

    @question_rating.map do |r|
      answer = Answer.select('sum(rating) as rating').where(user_id: r.user_id)
      r.rating += answer.first.rating unless answer.first.rating.nil?
    end
  end

  # get /admin/users
  def user_statistic
    @question_rating = Question.group(:user).count

    @answers_rating = Answer.select('user, count(rating) as rating').group(:user_id)
  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'nikitasmall' && password == '2371757350'
    end
  end
end
