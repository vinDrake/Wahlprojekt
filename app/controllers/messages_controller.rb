class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  # before_action :require_user, only: [:index, :show]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    unless current_user.nil?
      @all_messages = current_user.all_messages
      @incoming_messages = current_user.incoming_messages
      @leaving_messages = current_user.leaving_messages
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # TODO Dokumentieren
  # GET /messages/new
  def new
    @sender = current_user
    @user_select = User.all
    if params.has_key?(:receiver_id)
    @receiver = User.find(params[:receiver_id])
    end
    @receiver_select = current_user.other_users
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
    # @sender = current_user
    @user_select = User.all
    @receiver_select = User.all#current_user.other_users
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new } # OPTIMIZE Einen notice wäre nett
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:sender_id, :receiver_id, :subject, :content)
    end
end
