class RegistrationAvailabilitySection < RegistrationSection
  def name
    "Availability"
  end

  def key
    "availability"
  end

  def attributes
    Array.new(days.count) do |n|
      [
        :availability,
        collection: time_slots[(n * 2)..(n * 2 + 1)],
        label: days[n],
        as: :check_boxes,
        value_method: :value,
        label_method: :name,
      ]
    end
  end

  private

  def time_slots
    days.product(times).map do |pair|
      OpenStruct.new(name: pair.join(" "), value: pair.join(" ").parameterize.underscore)
    end
  end

  def days
    %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
  end

  def times
    %w(mornings evenings)
  end
end
