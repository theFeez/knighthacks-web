class RegistrationSection
  attr_reader :registration

  def initialize(registration)
    @registration = registration
  end

  def completed?
    flat_attributes.all? { |attribute| registration.send(attribute).present? }
  end

  def attributes
    []
  end

  protected

  def flat_attributes
    attributes.map do |attribute|
      if attribute.is_a? Array
        attribute[0]
      else
        attribute
      end
    end
  end
end
