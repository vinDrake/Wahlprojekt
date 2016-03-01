# Dieser Controller uebernimmt das Erstellen des Feeders.

class FeedersController < ApplicationController
  before_action :set_feeder, only: [:show, :edit, :update, :destroy]
 # before_action :require_user, only: [:index, :show]

  # GET /feeders
  # GET /feeders.json
  def index
    @feeders = Feeder.all
  end

  # GET /feeders/1
  # GET /feeders/1.json
  def show
  end

  # TODO Dokumentieren
  # GET /feeders/new

  # Diese Methode erstellt ein neues Feeder-Objekt.

  def new
    @feeder = Feeder.new
    @user_select = current_user.other_users
  end

  # GET /feeders/1/edit
  def edit
  end

  # POST /feeders
  # POST /feeders.json

  # Diese Methode erstellt ein neues Feeder-Objekt, welches einem User zugewiesen wird. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.

  def create
    @feeder = Feeder.new(feeder_params)
    # @user = User.find_by(feeder_params[:user])
    # @user.feeder = @feeder
    # @feeder = @user.feeder.create(feeder_params)


    respond_to do |format|
      if @feeder.save
      # if @user.save
        format.html { redirect_to @feeder, notice: 'Feeder was successfully created.' }
        format.json { render :show, status: :created, location: @feeder }
      else
        format.html { render :new } # OPTIMIZE Eine notice wäre nett
        format.json { render json: @feeder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeders/1
  # PATCH/PUT /feeders/1.json

  # Diese Methode aendert die Parameter eines Feeders. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.

  def update
    respond_to do |format|
      if @feeder.update(feeder_params)
        format.html { redirect_to @feeder, notice: 'Feeder was successfully updated.' }
        format.json { render :show, status: :ok, location: @feeder }
      else
        format.html { render :edit }
        format.json { render json: @feeder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeders/1
  # DELETE /feeders/1.json

  # Diese Methode loescht einen Feeder.
  
  def destroy
    @feeder.destroy
    respond_to do |format|
      format.html { redirect_to feeders_url, notice: 'Feeder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feeder
      @feeder = Feeder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feeder_params
      params.require(:feeder).permit(:user_id)
    end

end
