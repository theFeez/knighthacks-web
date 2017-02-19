class User < ApplicationRecord
  validates :email, uniqueness: true, format: /\A\S+@\S+\z/
end
