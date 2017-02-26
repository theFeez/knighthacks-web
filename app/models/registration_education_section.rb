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
      [
        :born_on,
        {
          label: "Date of birth",
          start_year: Date.today.year - 90,
          end_year: Date.today.year - 14,
        },
      ],
    ]
  end
end
