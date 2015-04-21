require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  setup do

  end

  test "one user should change for one question rate-point" do
    @question = questions(:one)
    @user = users(:one)

    assert_difference('@question.rating', 1) do
      UserMarks.up_question_rating @question, @user
      UserMarks.up_question_rating @question, @user
    end
  end

  test "one user should change for one answer rate-point down" do
    @user = users(:one)
    @answer = answers(:one)

    assert_difference('@answer.rating', -1) do
      UserMarks.down_answer_rating @answer, @user
      UserMarks.down_answer_rating @answer, @user
    end
  end

  test "one user should change for one answer rate-point up" do
    @user = users(:one)
    @answer = answers(:one)

    assert_difference('@answer.rating', 1) do
      UserMarks.up_answer_rating @answer, @user
      UserMarks.up_answer_rating @answer, @user
    end
  end
end
