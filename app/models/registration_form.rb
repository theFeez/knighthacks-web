class RegistrationForm
  attr_reader :user, :current_section

  def initialize(user, current_section)
    @user = user
    @current_section = section_from_key(current_section)
  end

  def sections
    [
      RegistrationBasicInfoSection.new(user),
      RegistrationEducationSection.new(user),
    ]
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

  def section_from_key(key)
    sections.detect { |section| section.key == key }
  end
end
