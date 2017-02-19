class User < ApplicationRecord
  validates :email, uniqueness: true, format: /\A\S+@\S+\z/

  def shirt_fit
    "#{shirt_fit_sex} #{shirt_fit_size}"
  end
end
