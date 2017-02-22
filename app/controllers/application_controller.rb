class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @countdown = Countdown.new
  end

  private

  def current_registration
    @current_registration ||= Registration.find_by(id: session[:registration_id]) || Registration.new
  end
  helper_method :current_registration
end
