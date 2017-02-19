class RegistrationRolesSection < RegistrationSection
  def name
    "Roles"
  end

  def key
    "roles"
  end

  def attributes
    [
      [:roles, { collection: roles, as: :check_boxes, label_method: :first, value_method: :last }],
    ]
  end

  def roles
    [["Hacker", "hacker"], ["Mentor", "mentor"], ["Volunteer", "volunteer"]]
  end
end
