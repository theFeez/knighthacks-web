class RegistrationMentorSection < RegistrationSection
  def name
    "Mentoring"
  end

  def key
    "mentoring"
  end

  def attributes
    [
      [:why_mentor, as: :text, label: "Why do you want to be a mentor?"],
      [:tech_stack, as: :text, label: "What technologies are you most comfortable with?"],
    ]
  end
end
