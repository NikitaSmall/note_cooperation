module Solutions extend ActiveSupport::Concern
  protected
  def mark_question_solved(question_id)
    question = Question.find(question_id)
    question.solved = true

    question.save
  end
end