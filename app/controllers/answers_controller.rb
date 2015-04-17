class AnswersController < ApplicationController
  include Solutions
  before_filter :set_answer, only: [:destroy, :mark_answer_as_solution, :unmark_answer_as_solution, :up_rating, :down_rating]
  before_action :authenticate_user!

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
        format.js {}
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answer/1
  def destroy
    question = @answer.question
    if @answer.solution
      question.solved = false
      question.save
    end
    @answer.destroy
    respond_to do |format|
      format.html {redirect_to question, notice: 'Ответ был удалён'}
      format.js {}
    end
  end

  # PUT /answer/yes/1
  def mark_answer_as_solution
    question = @answer.question
    @answer.solution = true
    @answer.save

    mark_question_solved question.id

    respond_to do |format|
      format.html {redirect_to question, notice: 'Ответ получен'}
    end
  end

  # PUT /answer/no/1
  def unmark_answer_as_solution
    question = @answer.question
    @answer.solution = false
    @answer.save

    mark_question_unsolved question.id

    respond_to do |format|
      format.html {redirect_to question, notice: 'Ответ снят'}
    end
  end

  # PUT /answer/up/1
  def up_rating
    UserMarks.up_answer_rating @answer, current_user

    respond_to do |format|
      format.html {redirect_to @answer.question}
      format.js {}
    end
  end

  # PUT /answer/down/1
  def down_rating
    UserMarks.down_answer_rating @answer, current_user

    respond_to do |format|
      format.html {redirect_to @answer.question}
      format.js {}
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
