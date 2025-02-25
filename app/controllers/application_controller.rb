class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    # This would be done with a proper authentication system like Devise gem
    # This is just a simulation
    @current_user ||= User.first
  end
end
