class RegistrationForm
  attr_reader :registration, :current_section

  def initialize(registration, current_section)
    @registration = registration
    @current_section = section_from_key(current_section)
  end

  def sections
    base = [
      RegistrationBasicInfoSection,
      RegistrationRolesSection,
    ]

    registration.roles.each do |role|
      base += send("#{role}_sections")
    end

    base.uniq.map { |klass| klass.new(registration) }
  end

  def previous_section
    previous_index = sections.find_index { |section| section.key == current_section.key } - 1
    return nil if previous_index < 0

    sections[previous_index]
  end

  def next_section
    next_index = sections.find_index { |section| section.key == current_section.key } + 1
    sections[next_index]
  end

  private

  def hacker_sections
    [
      RegistrationEducationSection,
      RegistrationTravelSection,
      RegistrationExperienceSection,
      RegistrationWrapupSection,
    ]
  end

  def mentor_sections
    [
      RegistrationMentorSection,
      RegistrationAvailabilitySection,
    ]
  end

  def volunteer_sections
    [
      RegistrationAvailabilitySection,
    ]
  end

  def section_from_key(key)
    sections.detect { |section| section.key == key }
  end
end
