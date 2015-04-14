class UserMarks < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  belongs_to :question

  def self.up_answer_rating (answer, current_user)
    mark = UserMarks.where(answer_id: answer.id, user_id: current_user.id)

    if mark.count == 0
      answer.rating += 1
      answer.save

      mark = UserMarks.new(answer_id: answer.id, user_id: current_user.id)
      mark.save
    end
  end

  def self.down_answer_rating (answer, current_user)
    mark = UserMarks.where(answer_id: answer.id, user_id: current_user.id)

    if mark.count == 0
      answer.rating -= 1
      answer.save

      mark = UserMarks.new(answer_id: answer.id, user_id: current_user.id)
      mark.save
    end
  end

  def self.down_question_rating (question, current_user)
    mark = UserMarks.where(question_id: question.id, user_id: current_user.id)

    if mark.count == 0
      question.rating -= 1
      question.save

      mark = UserMarks.new(question_id: question.id, user_id: current_user.id)
      mark.save
    end
  end

  def self.up_question_rating (question, current_user)
    mark = UserMarks.where(question_id: question.id, user_id: current_user.id)

    if mark.count == 0
      question.rating += 1
      question.save

      mark = UserMarks.new(question_id: question.id, user_id: current_user.id)
      mark.save
    end
  end
end
