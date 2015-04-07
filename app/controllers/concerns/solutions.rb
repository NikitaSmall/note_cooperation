module Solutions extend ActiveSupport::Concern
  protected
  def mark_question_solved(question_id)
    question = Question.find(question_id)
    question.solved = true

    question.save
  end
  protected
  def mark_question_unsolved(question_id)
    question = Question.find(question_id)
    question.solved = false

    question.save
  end
end