class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper_methods are methods that can be used inside of views
  helper_method :current_user

  def welcome
    render '/welcome'
  end

  def amiloggedin
    amiloggedin = !!session[:current_user_id]
    # render text: amiloggedin ? "yes" : "no"
    render json: current_user
  end

  private

  def current_user
    if session[:current_user_id]
      @current_user ||= User.find(session[:current_user_id])
    else
      @current_user = nil
      # {} or false, or nil--we can send back whatever we want here.
    end
    # @current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_current_user
    redirect_to root_path unless logged_in?
  end

end
