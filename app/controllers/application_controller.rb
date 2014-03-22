class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :session_expiry, :except => [:signin, :signout]
  before_filter :update_activity_time, :except => [:signin, :signout]

  include SessionsHelper

  def session_expiry
    get_session_time_left
    unless @session_time_left > 0
      sign_out
      deny_access 'Your session has timed out. Please log back in.'
    end
  end

  def update_activity_time
    session[:expires_at] = 30.minutes.from_now
  end

  private

  def get_session_time_left
    expire_time = session[:expires_at] || Time.now
    @session_time_left = (expire_time - Time.now).to_i
  end
end
