class Registration < ApplicationRecord
  ROLES = %w(hacker mentor volunteer).freeze

  validates :email, uniqueness: true, format: /\A\S+@\S+\z/
  validates :university_email, format: /\A\S+@\S+\.edu\z/
  validates :phone, format: /[\d\-()\s]+/, allow_blank: true
  validates_presence_of(
    :availability,
    :born_on,
    :email,
    :event_expectations,
    :expected_graduation,
    :full_name,
    :interests,
    :major,
    :number_of_hackathons,
    :phone,
    :proud_project,
    :roles,
    :shirt_fit,
    :tech_stack,
    :university_email,
    :university_name,
    :why_mentor,
  )

  scope :submitted, -> { where.not(submitted_at: nil) }
  scope :pending, -> { where(submitted_at: nil) }

  def shirt_fit
    "#{shirt_fit_sex} #{shirt_fit_size}"
  end

  def submitted?
    submitted_at?
  end

  # HACK figure out why simple_form generates hidden inputs with empty strings.
  def availability=(list)
    super list.select(&:present?)
  end

  def roles=(list)
    super list.select(&:present?) & ROLES
  end
end
