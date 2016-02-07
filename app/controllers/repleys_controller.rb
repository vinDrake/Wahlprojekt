class RepleysController < ApplicationController
  before_action :set_repley, only: [:show, :edit, :update, :destroy]
  # before_action :require_user, only: [:index, :show, :new]

  # GET /repleys
  # GET /repleys.json
  def index
    unless current_user.nil?
      @repleys = current_user.repleys
    else
      @repleys = Repley.all
    end
  end

  # GET /repleys/1
  # GET /repleys/1.json
  def show
  end

  # TODO Dokumentieren
  # GET /repleys/new
  def new
    # TODO Hier steht mir auch viel zu viel.
    @user_select = User.all
    @question_select = Question.all
    @answer_select = Answer.all
    @user = current_user
    if current_user

      # TODO Feeder füttern?!?!?1
      if current_user.feeds.size <= 0
        @user.feeder.add_feed
      end
      if current_user.feeds

        @feed = current_user.get_next_feed
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
  def create # OPTIMIZE Am besten die ganze Methode neu schreiben
    #Scaffold generated
    @repley = Repley.new(repley_params)
    # Irgendwo den User her bekommen
    unless current_user.nil?
      @user = current_user
    else
      @user = User.find(repley_params[:user_id])
    end

    # Feed holen
    @feed = @user.feeds.first

    # TODO Hier ist auch zu viel Code im Controller
    # Begin Points
    if @repley.answer.correct
      @repley.points = 1
    else
      @repley.points = 0
    end
    # End Points

    # TODO ersetzen
    unless @user.feeds.size >= 1
      question = Question.order("RANDOM()").first
      feed = Feed.new(:feeder_id => @user.feeder.id, :question_id => question.id, :priority => 0)
      feed.save
    end

    respond_to do |format|
      if @repley.save
        # TODO Den beantworteten Feed zerstören -> Kann das Model machen
        user_feeds = @user.feeds
        user_feeds.find_by(repley_params[:question]).destroy

        # TODO Braucht die App größtenteils nicht. Außer das Attribute setzen. Das kann aber auch das Model
        # Begin Check if it was the last one of this Challenge
        unless @feed.participation.nil?
          last = true
          user_feeds.each do |feed|
            if feed.participation_id == @feed.participation_id
              last = false
              break
            end
          end
          if last
            participation = @feed.participation
            participation.attributes = { :complete => true, :succeeded => true }
            if participation.save
              logger.debug "This Participation is now complete and succeeded"
            end
          end
        end

        # # End Check if it was the last one of this Challenge
        # if @repley.answer.correct
        #   note = 'Repley was successfully created and the answer was correct. You got '+@repley.points.to_s+' Point.'
        # else
        #   note = 'Repley was successfully created and the answer was wrong.'
        # end
        # if last
        #   note += ' It also was the last Question of "'+participation.challenge.name+'".'
        # end

        format.html { redirect_to @repley, notice: note }
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
      params.permit(:correct, :question_id, :user_id, :answer_id)
    end
end
