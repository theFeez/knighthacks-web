class RegistrationEducationSection < RegistrationSection
  def name
    "Education"
  end

  def key
    "education"
  end

  def attributes
    [
      [:university_name, { label: "University" }],
      :major,
      [:university_email, { placeholder: ".edu", as: :email }],
      [:expected_graduation, { placeholder: 'e.g. "Fall 2018"' }],
      [:born_on, { label: "Date of birth", placeholder: "e.g. 1/27/96", as: :string }],
    ]
  end
end
