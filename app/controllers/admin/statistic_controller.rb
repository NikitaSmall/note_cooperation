class Admin::StatisticController < ApplicationController
  layout "admin"

  before_filter :authenticate

  # get /admin/statistic
  def index

    @question_rating = Question.get_user_summary_rating
  end

  # get /admin/users
  def user_statistic
    @question_rating = Question.get_user_statistic
    @answers_rating = Answer.get_user_statistic
  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'nikitasmall' && password == '2371757350'
    end
  end
end
