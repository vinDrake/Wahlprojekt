# Dieser Controller uebernimmt die Bearbeitung und Zuweisung eines Feeds zu einem Feeder.

class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
 # before_action :require_user, only: [:index, :show]

  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.all
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
  end

  # GET /feeds/new
  
  # Diese Methode erstellt ein Feed, welches einem Feeder zugewiesen wird.
  
  def new
    @feed = Feed.new
    @question_select = Question.all
    @feeder_select = Feeder.all
  end

  # GET /feeds/1/edit
  def edit
    @question_select = Question.all
    @feeder_select = Feeder.all
  end

  # POST /feeds
  # POST /feeds.json
  
  # Diese Methode fuellt ein Feed mit den noetigen Parametern. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.
  
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  
  # Diese Methode aendert die Parameter des Feeds. Ist dies nicht moeglich, wird eine Fehlermeldung angezeigt.
  
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  
  # Diese Methode loescht ein Feed.
  
  def destroy
  
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:id, :feeder_id, :question_id, :priority, :challenge_id, :participation_id)
    end
end
