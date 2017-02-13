class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @countdown = Countdown.new
  end
end
