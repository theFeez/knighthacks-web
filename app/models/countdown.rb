class Countdown
  HACKATHON_STARTS_AT = ENV.fetch("HACKATHON_STARTS_AT")

  def days
    absolute_seconds / 86400
  end

  def hours
    absolute_seconds / 3600 % 24
  end

  def minutes
    absolute_seconds / 60 % 60
  end

  def seconds
    absolute_seconds % 60
  end

  private

  def hackathon_starts_at
    Time.zone.parse(HACKATHON_STARTS_AT)
  end

  def absolute_seconds
    (hackathon_starts_at - Time.zone.now).ceil
  end
end
