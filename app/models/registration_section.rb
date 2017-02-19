class RegistrationSection
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def completed?
    flat_attributes.all? { |attribute| user.send(attribute).present? }
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
