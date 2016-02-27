# Dieser Controller verwaltet die Tags, deren Fragen in den Feedern vorkommen sollen.

class SelectionsController < ApplicationController
  before_action :set_selection, only: [:show, :edit, :update, :destroy]
 # before_action :require_user, only: [:index, :show]

  # GET /selections
  # GET /selections.json
  def index
    @selections = Selection.where(feeder: current_user.feeder)
  end

  # GET /selections/1
  # GET /selections/1.json
  def show
  end

  # GET /selections/new
  def new
    @selection = Selection.new
    @tag_select = Tag.all
    @feeder_select = Feeder.all
  end

  # GET /selections/1/edit
  def edit
  end

  # POST /selections
  # POST /selections.json
  
  # Diese Methode erstellt eine neue Zuweisung eines Tags zu einem Feeder. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.
  
  def create
    @selection = Selection.new(selection_params)

    respond_to do |format|
      if @selection.save
        format.html { redirect_to @selection, notice: 'Selection was successfully created.' }
        format.json { render :show, status: :created, location: @selection }
      else
        format.html { render :new }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selections/1
  # PATCH/PUT /selections/1.json
  
  # Diese Methode fuegt einem Feeder einen neuen Tag hinzu. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.
  
  def update
    respond_to do |format|
      if @selection.update(selection_params)
        format.html { redirect_to @selection, notice: 'Selection was successfully updated.' }
        format.json { render :show, status: :ok, location: @selection }
      else
        format.html { render :edit }
        format.json { render json: @selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selections/1
  # DELETE /selections/1.json
  
  # Diese Methode entfernt einen Tag aus einem Feeder.
  
  def destroy
    @selection.destroy
    respond_to do |format|
      format.html { redirect_to selections_url, notice: 'Selection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selection
      @selection = Selection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selection_params
      params.require(:selection).permit(:tag_id, :feeder_id)
    end
end
