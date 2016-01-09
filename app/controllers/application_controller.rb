class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :require_user

  # TODO Dokumentieren
  # TODO Der Code variert in den verscheidenen Branches und MUSS von Hand gemerged werden!!!
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Session Error"
      session[:user_id] = nil
      redirect_to '/'
  end
  def require_user
    redirect_to '/login' unless current_user
  end
end
