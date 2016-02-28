# Dieser Controller weist jeder Frage ihre entsprechenden Tags zu.

class TiesController < ApplicationController

    before_action :set_tie, only: [:show, :edit, :update, :destroy]
   # before_action :require_user, only: [:index, :show]

    # GET /ties
    # GET /ties.json
    def index
      @ties = Tie.all
    end

    # GET /ties/1
    # GET /ties/1.json
    def show
    end

    # TODO Dokumentieren
    # GET /ties/new

    # Diese Methode erstellt eine neue Zuweisung zwischen Tag und Frag und die findet die Frage, deren ID uebergeben wurde.

    def new
      @tie = Tie.new
      @tag_select = Tag.all # OPTIMIZE Nur in Frage kommenden Tags anzeigen
      if params.has_key?(:question_id)
      @question = Question.find(params[:question_id])
      end
      @question_select = Question.all # OPTIMIZE Nur in Frgae kommende Fragen anzeigen
    end

    # GET /ties/1/edit
    def edit
    end

    # POST /ties
    # POST /ties.json

    # Diese Methode weist einer Frage einen neuen Tag zu. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.

    def create
      @tie = Tie.new(tie_params)

      respond_to do |format|
        if @tie.save
          format.html { redirect_to @tie, notice: 'Tie was successfully created.' }
          format.json { render :show, status: :created, location: @tie }
        else
          format.html { render :new } # OPTIMIZE Einen notice wäre nett
          format.json { render json: @tie.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /ties/1
    # PATCH/PUT /ties/1.json
    def update
      respond_to do |format|
        if @tie.update(tie_params)
          format.html { redirect_to @tie, notice: 'Tie was successfully updated.' }
          format.json { render :show, status: :ok, location: @tie }
        else
          format.html { render :edit }
          format.json { render json: @tie.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /ties/1
    # DELETE /ties/1.json

    # Diese Methode entfernt einen Tag einer Frage.

    def destroy
      @tie.destroy
      respond_to do |format|
        format.html { redirect_to ties_url, notice: 'Tie was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tie
        @tie = Tie.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def tie_params
        params.require(:tie).permit(:question_id, :tag_id)
      end


end
