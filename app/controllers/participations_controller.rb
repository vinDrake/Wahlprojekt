# Dieser Controller verwaltet die Zugehoerigkeit von Benutzern zu Challenges

class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]
  # before_action :require_user, only: [:index, :show]

  # GET /participations
  # GET /participations.json
  def index
    @participations = Participation.all
  end

  # GET /participations/1
  # GET /participations/1.json
  def show
  end

  # TODO Dokumentieren
  # GET /participations/new

  # Diese Methode erstellt eine Participation. Der Name des Users wird uebergeben und die zugehoerige User-ID zu diesem herausgesucht.

  def new
    @challenge_select = Challenge.get_alive_challenges
    if params.has_key?(:user)
      @user = User.find(params[:user])
    end
    @user_select = current_user.other_users
    @participation = Participation.new
  end


  # GET /participations/1/edit
  def edit
    @challenge_select = Challenge.all
    @user_select = User.all
    # TODO Was macht das hier? Das scheint mir ein Fehler zu sein. DONE!
    # @participation = Participation.new
  end

  # POST /participations
  # POST /participations.json

  # Diese Methode erstellt eine neue Participation entsprechend den uebergebenen Parametern. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.

  def create # OPTIMIZE Hier ist mir viel zu viel Code. DAvon gehört bestimmt einiges in das Model
    #Scaffold generated
    @user_select = User.all
    @challenge_select = Challenge.get_alive_challenges
    @participation = Participation.new(participation_params)
    # Begin Set strikes
    @participation.strikes = 0
    # End Set Strikes

    # Begin Set complete
    @participation.complete = false
    # End Set complete

    # Begin Set succeeded
    @participation.succeeded = false
    # End Set succeeded

    #Ben generated
    # @challenge = Challenge.find(participation_params[:challenge_id])
    # @participation = @challenge.participation.create(participation_params)


    respond_to do |format|
      if @participation.save
        # add_questions_to_feeder # Ersetzt durch after_create
        format.html { redirect_to @participation, notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participations/1
  # PATCH/PUT /participations/1.json

  # Diese Methode aendert eine Participation. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.

  def update
    respond_to do |format|
      if participation_params[:id].nil?
        participation_params[:id] = @participation.id
        logger.debug "Participation ID= "+participation_params[:id].to_s
      end
      if @participation.update(participation_params)
        # check_complete # Ersetzt durch after_update im Model
        format.html { redirect_to @participation, notice: 'Participation was successfully updated.' }
        format.json { render :show, status: :ok, location: @participation }
      else
        format.html { render :edit }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participations/1
  # DELETE /participations/1.json

  # Diese Methode loescht eine Participation.
  
  def destroy
    @participation.destroy
    respond_to do |format|
      format.html { redirect_to participations_url, notice: 'Participation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participation_params
      params.require(:participation).permit(:id, :user_id, :challenge_id, :complete, :succeeded, :strikes)
    end







    # OPTIMIZE Hier kann bestimmt einiges in die Model
    # Anfang Check Complete und Fragen aus dem Feeder
    # def check_complete
    #   if @participation.complete
    #     logger.debug "Check if Participation is complete!"
    #     remove_questions_from_feeder
    #   end
    # end

    # def remove_questions_from_feeder
    #   logger.debug "Remove Questions from Feeder"
    #   current_user.feeds.each do |feed|
    #     logger.debug "This is a Question in Feeder: "+feed.question.problem
    #     if feed.challenge = @participation.challenge
    #       logger.debug "Destroy Feed"
    #       feed.destroy
    #     end
    #   end
    # end
    # Ende Check Complete und Fragen aus dem Feeder

    # # Anfang Fragen in Feeder
    # def add_questions_to_feeder
    #   base_priority = 0
    #   current_user.feeds.each do |feed|
    #     if feed.priority > base_priority
    #       base_priority = feed.priority
    #     end
    #   end
    #
    #   if @participation.challenge.strict_order
    #
    #     question_count = @participation.challenge.questions.count
    #     order = question_count
    #     @participation.challenge.questions.each do |question|
    #       feed = Feed.new(:feeder_id => current_user.feeder.id, :question_id => question.id, :priority => base_priority+order+1, :challenge_id => @participation.challenge.id, :participation_id => @participation.id)
    #       feed.save
    #       order -= 1
    #     end
    #   else
    #     @participation.challenge.questions.each do |question|
    #       feed = Feed.new(:feeder_id => current_user.feeder.id, :question_id => question.id, :priority => base_priority+1, :challenge_id => @participation.challenge.id, :participation_id => @participation.id)
    #       feed.save
    #     end
    #   end
    # end
    # # Ende Fragen in Feeder
end
