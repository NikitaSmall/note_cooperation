class AnswersController < ApplicationController


  private
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:text, :rating, :question_id)
  end
end
