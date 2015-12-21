class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  helper_method :current_user

  before_action :require_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def require_user
    # redirect_to '/login' unless current_user
  end

  # Begin CORS-Code

  protect_from_forgery unless: -> { request.format.json? }
  after_filter :set_cross_domain_access

  def set_cross_domain_access
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, PUT, POST, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
  end

  # End CORS
end
