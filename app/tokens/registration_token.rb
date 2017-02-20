class RegistrationToken
  attr_reader :user

  def self.user_for(token)
    decoded, = JWT.decode(token, secret, algorithm)

    User.find(decoded["sub"])
  end

  def self.secret
    Rails.application.secrets.secret_key_base
  end

  def self.algorithm
    "HS256"
  end

  def initialize(user)
    @user = user
  end

  def encoded
    JWT.encode({ "sub" => user.id }, self.class.secret, self.class.algorithm)
  end
end
