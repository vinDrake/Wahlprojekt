# Dieser Controller enthaelt die Logik fuer die Challenges.

class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  # before_action :require_user, only: [:index, :show]

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    @question_select = Question.all # OPTIMIZE Nur die Fragen, die noch nicht in der Challenge sinbd wären nett
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  
  # Diese Methode erstellt eine neue Challenge anhand der uebergebenen Parameter. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.
  
  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to new_element_path(challenge_id: @challenge), notice: 'Challenge was successfully created.' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new } # OPTIMIZE Eine notice wäre nett
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  
  # Diese Methode veraendert eine Challenge. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.
  
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        @challenge.check_life_signs
        # Replaced by check_life_signs
        # unless @challenge.alive # OPTIMIZE Das gehört eher in das Model
        #   @challenge.participations.each do |participation|
        #     participation.complete = true
        #     participation.save
        #   end
        # end
        format.html { redirect_to challenges_path, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  
  # Diese Methode loescht eine Challenge.
  
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:name, :alive, :max_challenge_time, :latest_end, :strict_order, :strikes)
    end
end
