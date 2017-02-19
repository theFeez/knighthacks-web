class RegistrationBasicInfoSection < RegistrationSection
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def name
    "Basic info"
  end

  def key
    "basic"
  end

  def attributes
    [
      :full_name,
      :email,
      :phone,
      :shirt_fit_sex,
      :shirt_fit_size,
    ]
  end
end
