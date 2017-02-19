class RegistrationWrapupSection < RegistrationSection
  def name
    "Wrap-up"
  end

  def key
    "wrap-up"
  end

  def attributes
    [
      [:proud_project, as: :text,      label: "What is a project you're proud of?"],
      [:event_expectations, as: :text, label: "What do you hope to get out of KnightHacks 2017?"],
      [:additional_remarks, as: :text, label: "Any additional comments or questions?"],
    ]
  end
end
