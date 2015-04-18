class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy, :raise_rating, :down_rating]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /questions
  # GET /questions.json
  def index
    if params[:tag]
      @questions = Question.tagged_with(params[:tag]).order(created_at: :desc)
    else
      @questions = Question.all.order(created_at: :desc)
    end

  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answers = Answer.where(question_id: @question.id).order(created_at: :desc)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # PUT /questions/rise/1
  def raise_rating
    UserMarks.up_question_rating @question, current_user

    respond_to do |format|
      format.html {redirect_to @question, notice: 'Рейтинг вопроса успешно поднят'}
      format.js {}
    end
  end

  # PUT /questions/down/1
  def down_rating
    UserMarks.down_question_rating @question, current_user

    respond_to do |format|
      format.html {redirect_to @question, notice: 'Рейтинг вопроса успешно опущен'}
      format.js {}
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.topic_list.add(params[:tags])
    @question.user = current_user
    @question.rating = 0
    @question.solved = false

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :text, :rating, :solved, :bootsy_image_gallery_id, :tag_list)
    end
end
