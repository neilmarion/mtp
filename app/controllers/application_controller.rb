class ApplicationController < ActionController::Base

  protect_from_forgery
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_organization
    if session[:current_organization_id]
      Organization.find(session[:current_organization_id])
    else
      @current_organization ||= Organization.find(current_user.organization_id)
    end
  end
  
  helper_method :current_user
  helper_method :current_organization
end
