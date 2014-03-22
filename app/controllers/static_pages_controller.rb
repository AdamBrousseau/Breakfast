class StaticPagesController < ApplicationController
	skip_before_filter :session_expiry
	skip_before_filter :update_activity_time

  def home
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
