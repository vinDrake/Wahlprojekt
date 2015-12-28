class RepleysController < ApplicationController
  before_action :set_repley, only: [:show, :edit, :update, :destroy]
 # before_action :require_user, only: [:index, :show, :new]

  # GET /repleys
  # GET /repleys.json
  def index
    @repleys = Repley.all
  end

  # GET /repleys/1
  # GET /repleys/1.json
  def show
  end

  # GET /repleys/new
  def new
    @user_select = User.all
    @question_select = Question.all
    @answer_select = Answer.all
    if current_user
      @user = current_user
      unless @user.feeds.size >= 3
        question = Question.order("RANDOM()").first
        feed = Feed.new(:feeder_id => @user.feeder.id, :question_id => question.id, :priority => 0)
        feed.save
      end
      if @user.feeds

        @feed = @user.feeds.first
        @question = @feed.question

      end
    end
    @repley = Repley.new
  end

  # GET /repleys/1/edit
  def edit
  end

  # POST /repleys
  # POST /repleys.json
  def create
    #Scaffold generated
    @repley = Repley.new(repley_params)

    #Ben generated
    # if repley_params[:user_id].nil?
    #   repley_params[:user_id] = current_user.id
    # end
#    @question = Question.find(params[:question_id])
    #  @repley = Repleys.create(repley_params)


    # Begin Points
    if @repley.answer.correct
      @repley.points = 1
    else
      @repley.points = 0
    end
    # End Points

    @user = current_user
    unless @user.feeds.size >= 1
      question = Question.order("RANDOM()").first
      feed = Feed.new(:feeder_id => @user.feeder.id, :question_id => question.id, :priority => 0)
      feed.save
    end

    respond_to do |format|
      if @repley.save
        current_user.feeds.find_by(repley_params[:question]).destroy
        format.html { redirect_to '@repley', notice: 'Repley was successfully created.' }
        format.json { render :show, status: :created, location: @repley }
      else
        format.html { render :new }
        format.json { render json: @repley.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repleys/1
  # PATCH/PUT /repleys/1.json
  def update
    respond_to do |format|
      if @repley.update(repley_params)
        format.html { redirect_to @repley, notice: 'Repley was successfully updated.' }
        format.json { render :show, status: :ok, location: @repley }
      else
        format.html { render :edit }
        format.json { render json: @repley.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repleys/1
  # DELETE /repleys/1.json
  def destroy
    @repley.destroy
    respond_to do |format|
      format.html { redirect_to repleys_url, notice: 'Repley was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repley
      @repley = Repley.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repley_params
      params.require(:repley).permit(:correct, :question_id, :user_id, :answer_id)
    end
end
