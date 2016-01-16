class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  helper_method :current_user

  before_action :require_user

  # TODO Dokumentieren
  # TODO Der Code variert in den verscheidenen Branches und MUSS von Hand gemerged werden!!!
  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
      # @current_user = current_user
      rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Session Error"
      session[:user_id] = nil
      redirect_to '/'
  end
  def require_user
    # redirect_to '/login' unless current_user
  end

  # Begin CORS-Code

  # protect_from_forgery unless: -> { request.format.json? }
  # before_filter :set_cross_domain_access
  #
  # def set_cross_domain_access
  #   headers['Access-Control-Allow-Origin'] = '*'
  #   headers['Access-Control-Allow-Methods'] = 'GET, PUT, POST, DELETE, OPTIONS'
  #   # headers['Access-Control-Allow-Headers'] = '*'
  # end

  before_filter :cors_preflight_check
after_filter :cors_set_access_control_headers

def cors_set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
  headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
  headers['Access-Control-Max-Age'] = "1728000"
end

def cors_preflight_check
  if request.method == 'OPTIONS'
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
    headers['Access-Control-Max-Age'] = '1728000'

    render :text => '', :content_type => 'text/plain'
  end
end

  # End CORS
end
