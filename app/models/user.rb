class User < ApplicationRecord
  has_secure_token :registration_token

  validates :email, uniqueness: true, format: /\A\S+@\S+\z/
end
