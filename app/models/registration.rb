class Registration < ApplicationRecord
  ROLES = %w(hacker mentor volunteer).freeze

  validates :email, uniqueness: true, format: /\A\S+@\S+\z/

  def shirt_fit
    "#{shirt_fit_sex} #{shirt_fit_size}"
  end

  # HACK figure out why simple_form generates hidden inputs with empty strings.
  def availability=(list)
    super list.select(&:present?)
  end

  def roles=(list)
    super list.select(&:present?) & ROLES
  end
end
