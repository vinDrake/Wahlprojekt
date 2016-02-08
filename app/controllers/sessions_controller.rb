class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  def new
  end
  # TODO Dokumentieren
  # TODO Aufräumen
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
