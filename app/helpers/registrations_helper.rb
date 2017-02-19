module RegistrationsHelper
  def registration_section_link(section)
    link_to(
      section.name,
      apply_path(section.key),
      class: [
        current_class(apply_path(section.key)),
        section.completed? ? "completed" : "incomplete",
      ].join(" "),
    )
  end
end
