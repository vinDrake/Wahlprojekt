class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    respond_to do |format|
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        format.html { redirect_to '/home', notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to 'login' }
        format.json { render :show, location: @user }

        # format.json { render json: @session.errors, status: :unprocessable_entity }
      end

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
