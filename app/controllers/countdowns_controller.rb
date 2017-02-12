class CountdownsController < ApplicationController
  def index
    @countdown = Countdown.new
    render "countdowns/index.text", layout: false, content_type: "text/plain"
  end
end
