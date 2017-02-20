class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @countdown = Countdown.new
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) || User.new
  end
  helper_method :current_user
end
