class RegistrationSection
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def completed?
    attributes.all? { |attribute| user[attribute].present? }
  end

  def attributes
    []
  end
end
