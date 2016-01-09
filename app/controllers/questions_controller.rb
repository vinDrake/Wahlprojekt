class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  # before_action :require_user, only: [:index, :show]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
   @tags = @question.tags # OPTIMIZE Das ist Mist und gehört ins Model
  end

  # TODO Dokumentieren
  # GET /questions/new
  def new
    @tag_select = Tag.all # OPTIMIZE Nur Tags übergeben, die die Frage noch nicht hat.
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        # Wenn man eine Frage erstellt, dann braucht die auch Antworten
        format.html { redirect_to new_answer_path(question_id: @question)}
        # Die alte Weiterleitung zu questions#show
        # format.html { redirect_to @question, notice: 'Question was successfully created.' }
        # Die JSON-Version gibt nach wie vor das gleiche zurück
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new } # OPTIMIZE Eine notice wäre nett
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
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
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
      params.require(:question).permit(:problem)
    end
end
