class AnswersController < ApplicationController

  # POST /answer
  # POST /answer.json
  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.rating = 0
    #@answer.question = Question.find(question_id)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer.question, notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:text, :question_id)
  end
end
