class User < ApplicationRecord
  validates :email, uniqueness: true, format: /\A\S+@\S+\z/

  def shirt_fit
    "#{shirt_fit_sex} #{shirt_fit_size}"
  end

  # HACK figure out why simple_form generates hidden inputs with empty strings.
  def availability=(list)
    super list.select(&:presence)
  end
end
