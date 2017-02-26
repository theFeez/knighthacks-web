class RegistrationSection
  attr_reader :registration

  def initialize(registration)
    @registration = registration
  end

  def completed?
    (errors_without_validating_original.details.keys & flat_attributes).none?
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

  def errors_without_validating_original
    new_reference = Registration.find(registration.id)
    new_reference.validate
    new_reference.errors
  end
end
