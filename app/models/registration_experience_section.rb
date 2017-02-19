class RegistrationExperienceSection < RegistrationSection
  def name
    "Experience"
  end

  def key
    "experience"
  end

  def attributes
    [
      [:number_of_hackathons, label: "Number of hackathons attended"],
      [:github, label: "GitHub"],
      [:linkedin, label: "LinkedIn"],
      :website,
      [:additional_portfolio, label: "Anything else?"],
      # :resume, TODO
      [:interests, as: :text, placeholder: "e.g., React, Android, VR, gaming, Arduino"],
    ]
  end
end
