# Dieser Controller verbindet Challenges und Fragen.

class ElementsController < ApplicationController
  before_action :set_element, only: [:show, :edit, :update, :destroy]
 # before_action :require_user, only: [:index, :show]

  # GET /elements
  # GET /elements.json
  def index
    @elements = Element.all
  end

  # GET /elements/1
  # GET /elements/1.json
  def show
  end

  # TODO Dokumentieren
  # GET /elements/new
  
  # Diese Methode findet eine Challenge anhand der uebergebenen ID.
  
  def new
    @element = Element.new
    if params.has_key?(:challenge_id)
     @challenge = Challenge.find(params[:challenge_id])
    end
    @challenge_select = Challenge.get_alive_challenges
    @question_select = Question.all
  end

  # GET /elements/1/edit
  def edit
  end

  # POST /elements
  # POST /elements.json
  
  # Diese Methode weist einer Challenge eine Frage zu. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.
  
  def create
    @element = Element.new(element_params)

    respond_to do |format|
      if @element.save
        format.html { redirect_to new_element_path(challenge_id: @element.challenge), notice: 'Element was successfully created.' }
        format.json { render :show, status: :created, location: @element }
      else
        format.html { render :new } # OPTIMIZE Eine notice wöre nett
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elements/1
  # PATCH/PUT /elements/1.json
  
  # Diese Methode aendert eine Verbindung zwischen Challenge und Frage. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.
  
  def update
    respond_to do |format|
      if @element.update(element_params)
        format.html { redirect_to @element, notice: 'Element was successfully updated.' }
        format.json { render :show, status: :ok, location: @element }
      else
        format.html { render :edit }
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.json
  
  # Diese Methode loescht eine Verbindung zwischen Challenge und Frage.
  
  def destroy
    @element.destroy
    respond_to do |format|
      format.html { redirect_to elements_url, notice: 'Element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_element
      @element = Element.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def element_params
      params.require(:element).permit(:challenge_id, :question_id)
    end
end
