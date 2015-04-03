module NewQuestions extend ActiveSupport::Concern
  protected
  def get_new_questions
    @last_questions = Question.limit(5).order(created_at: :desc)
  end
end