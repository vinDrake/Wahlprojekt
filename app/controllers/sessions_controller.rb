# Dieser Controller verwaltet den Login.

class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  def new
  end
  # TODO Dokumentieren
  # TODO Aufräumen
  
  # Diese Methode verweist den Benutzer auf die Homepage, sofern seine eingebenen Daten stimmen. Ist dies nicht der Fall, verbleibt er auf der Login-Seite.
  
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      redirect_to '/login'
    end
  end

  # Diese Methode loggt den Benutzer aus.
  
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
