# Dieser Controller uebernimmt die Logik der ausgewaehlten Antwort.

class RepleysController < ApplicationController
  before_action :set_repley, only: [:show, :edit, :update, :destroy]
  # before_action :require_user, only: [:index, :show, :new]

  # GET /repleys
  # GET /repleys.json
  def index
    @repleys = Repley.where(user: current_user)
  end

  # GET /repleys/1
  # GET /repleys/1.json
  def show
  end

  # TODO Dokumentieren
  # GET /repleys/new
  
  # Diese Methode fuegt dem Feed eine neue Frage zu, falls momentan zwei oder weniger Fragen aktiv sind.
  
  def new
    # TODO Hier steht mir auch viel zu viel.
    @user_select = User.all
    @question_select = Question.all
    @answer_select = Answer.all
    @user = current_user
    if current_user

      # TODO Feeder füttern?!?!?1
      unless current_user.feeds.size >= 3
        question = Question.order("RANDOM()").first
        feed = Feed.new(:feeder_id => current_user.feeder.id, :question_id => question.id, :priority => 0)
        feed.save
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
  
  # Diese Methode formatiert die Antwortmoeglichkeiten in einer zufaelligen Reihenfolge, wertet die gegebene Antwort aus,
  # berechnet die zu vergebenden Punkte und beendet ggf. die Participation. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.
  
  def create # OPTIMIZE Am besten die ganze Methode neu schreiben
    #Scaffold generated
    @repley = Repley.new(repley_params)
    @feed = current_user.feeds.first
    #Ben generated
    # if repley_params[:user_id].nil?
    #   repley_params[:user_id] = current_user.id
    # end
#    @question = Question.find(params[:question_id])
    #  @repley = Repleys.create(repley_params)

    # TODO Hier ist auch zu viel Code im Controller
    # Begin Points
    if @repley.answer.correct
      @repley.points = 1
    else
      @repley.points = 0
    end
    # End Points

    unless current_user.feeds.size >= 1
      question = Question.order("RANDOM()").first
      feed = Feed.new(:feeder_id => current_user.feeder.id, :question_id => question.id, :priority => 0)
      feed.save
    end

    respond_to do |format|
      if @repley.save
        # flash[:succees] = 'New Repley Created'
        user_feeds = current_user.feeds
        user_feeds.find_by(repley_params[:question]).destroy
        # TODO Debug-Code raus
        # Begin Check if it was the last one of this Challenge
        logger.debug "Check if it was a challenge you are taking part of"
        unless @feed.participation.nil?
          logger.debug "It was a Challenge-Question. Check if it was the last question of this participation: "+@feed.participation.challenge.to_s
          last = true
          user_feeds.each do |feed|
            if feed.participation_id == @feed.participation_id
              logger.debug "No, there was another question"
              last = false
              break
            end
          end
          if last
            logger.debug "It was the last question"
            participation = @feed.participation
            participation.attributes = { :complete => true, :succeeded => true }
            if participation.save
              logger.debug "This participation is now complete and succeeded"
            end
            # participation.update(succeeded: true)
            # logger.debug "It is now succeeded"
          end
        else
          logger.debug "No, it was no Challenge-Question"
        end
        # End Check if it was the last one of this Challenge
        if @repley.answer.correct
          note = 'Reply was successfully created and the answer was correct.'
        else
          note = 'Reply was successfully created and the answer was wrong.'
        end
        if last
          note += ' It also was the last question of "'+participation.challenge.name+'".'
        end

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
  
  # Diese Methode aendert eine gegebene Antwort. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.
  
  def update
    respond_to do |format|
      if @repley.update(repley_params)
        format.html { redirect_to @repley, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @repley }
      else
        format.html { render :edit }
        format.json { render json: @repley.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repleys/1
  # DELETE /repleys/1.json
  
  # Diese Methode loescht eine gegebene Antwort. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.
  def destroy
  
    @repley.destroy
    respond_to do |format|
      format.html { redirect_to repleys_url, notice: 'Reply was successfully destroyed.' }
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
