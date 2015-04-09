class UserMarks < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  belongs_to :question

  def self.up_answer_rating (answer)
    mark = UserMarks.where(answer_id: answer.id, user_id: answer.user.id)

    if mark.count == 0
      answer.rating += 1
      answer.save

      mark = UserMarks.new(answer_id: answer.id, user_id: answer.user.id)
      mark.save
    end
  end

  def self.down_answer_rating (answer)
    mark = UserMarks.where(answer_id: answer.id, user_id: answer.user.id)

    if mark.count == 0
      answer.rating -= 1
      answer.save

      mark = UserMarks.new(answer_id: answer.id, user_id: answer.user.id)
      mark.save
    end
  end
end
