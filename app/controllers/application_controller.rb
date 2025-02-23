class ApplicationController < ActionController::Base
  private

  def current_user
    # This would be done with a proper authentication system like Devise gem
    # This is just a simulation
    @current_user ||= User.first
  end
end
