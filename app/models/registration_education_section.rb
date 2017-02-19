class RegistrationEducationSection < RegistrationSection
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def name
    "Education"
  end

  def key
    "education"
  end

  def attributes
    super # TODO
  end
end
