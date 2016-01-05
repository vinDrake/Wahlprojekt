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

  # GET /participations/new
  def new
    @challenge_select = Challenge.all
    @user = @current_user
    @user_select = User.all
    @participation = Participation.new
  end

  # GET /participations/1/edit
  def edit
    @challenge_select = Challenge.all
    @user = @current_user
    @user_select = User.all
    @participation = Participation.new
  end

  # POST /participations
  # POST /participations.json
  def create
    #Scaffold generated
    @user = @current_user
    @user_select = User.all
    @challenge_select = Challenge.all
    @participation = Participation.new(participation_params)

    #Ben generated
    @challenge = Challenge.find(participation_params[:challenge_id])
    # @participation = @challenge.participation.create(participation_params)

    # Begin Set strikes
    @participation.strikes = 0
    # End Set Strikes

    respond_to do |format|
      if @participation.save
        add_questions_to_feeder
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
  def update
    respond_to do |format|
      if participation_params[:id].nil?
        participation_params[:id] = @participation.id
        logger.debug "Participation ID= "+participation_params[:id].to_s
      end
      if @participation.update(participation_params)
        check_complete
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

    # Anfang Check Complete und Fragen aus dem Feeder
    def check_complete
      if @participation.complete
        logger.debug "Check if Participation is complete!"
        remove_questions_from_feeder
      end
    end

    def remove_questions_from_feeder
      logger.debug "Remove Questions from Feeder"
      @user.feeds.each do |feed|
        logger.debug "This is a Question in Feeder: "+feed.question.problem
        if feed.challenge = @participation.challenge
          logger.debug "Destroy Feed"
          feed.destroy
        end
      end
    end
    # Ende Check Complete und Fragen aus dem Feeder

    # Anfang Fragen in Feeder
    def add_questions_to_feeder
      base_priority = 0
      @user.feeds.each do |feed|
        if feed.priority > base_priority
          base_priority = feed.priority
        end
      end

      if @challenge.strict_order

        question_count = @challenge.questions.count
        order = question_count
        @challenge.questions.each do |question|
          feed = Feed.new(:feeder_id => @user.feeder.id, :question_id => question.id, :priority => base_priority+order+1, :challenge_id => @challenge.id)
          feed.save
          order -= 1
        end
      else
        @challenge.questions.each do |question|
          feed = Feed.new(:feeder_id => @user.feeder.id, :question_id => question.id, :priority => base_priority+1, :challenge_id => @challenge.id)
          feed.save
        end
      end
    end
    # Ende Fragen in Feeder
end
