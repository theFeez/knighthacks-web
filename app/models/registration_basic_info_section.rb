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
      [:email, { label: "Preferred e-mail", as: :email }],
      [:phone, { label: "Preferred phone number" }],
      [:shirt_fit, { as: :shirt_fit }],
    ]
  end
end
