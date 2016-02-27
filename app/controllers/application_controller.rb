# Dieser Controller prueft, ob ein Benutzer eingeloggt ist.

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :require_user

  # TODO Dokumentieren
  # TODO Der Code variiert in den verschiedenen Branches und MUSS von Hand gemerged werden!!!
  
  # Diese Methode findet den jetzigen Benutzer.
  
  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
      # @current_user = current_user
      rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Session Error"
      session[:user_id] = nil
      redirect_to '/'
  end
  
  # Falls kein Benutzer eingeloggt ist, wird er auf die Login-Seite verwiesen.
  
  def require_user
    redirect_to '/login' unless current_user
  end
end
