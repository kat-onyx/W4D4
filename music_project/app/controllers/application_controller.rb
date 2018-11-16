class ApplicationController < ActionController::Base

  helper_method :current_user

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    true if current_user
  end

  def logout!(user)
    if @current_user
      session[:session_token] = nil
    end
  end
end
