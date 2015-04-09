class AddUserQuestionAnswerToUserMarks < ActiveRecord::Migration
  def change
    add_reference :user_marks, :user, index: true
    add_reference :user_marks, :answer, index: true
    add_reference :user_marks, :question, index: true
  end
end
