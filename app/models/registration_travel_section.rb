class RegistrationTravelSection < RegistrationSection
  def name
    "Travel"
  end

  def key
    "travel"
  end

  def completed?
    registration.traveling_from_city.present? &&
      registration.traveling_to_city.present?
  end

  def attributes
    [
      :traveling_from_city,
      :traveling_to_city,
      [:travel_accommodations_needed, label: "I need assistance with travel"],
    ]
  end
end
