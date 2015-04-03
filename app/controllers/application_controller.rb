class ApplicationController < ActionController::Base
  include CurrentTag
  include NewQuestions
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_current_tag_name
  before_action :get_last_questions

  protected
  def get_last_questions
    @last_questions = get_new_questions
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
