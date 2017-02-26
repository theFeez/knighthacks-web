class RegistrationBasicInfoSection < RegistrationSection
  def name
    "Basic info"
  end

  def key
    "basic"
  end

  def attributes
    [
      [:full_name, disabled: true],
      [:email, { label: "Preferred e-mail", as: :email, disabled: true }],
      [:phone, { label: "Preferred phone number" }],
      [:shirt_fit, { as: :shirt_fit }],
    ]
  end
end
