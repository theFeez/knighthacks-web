class RegistrationToken
  attr_reader :registration

  def self.registration_for(token)
    decoded, = JWT.decode(token, secret, algorithm)

    Registration.find(decoded["sub"])
  end

  def self.secret
    Rails.application.secrets.secret_key_base
  end

  def self.algorithm
    "HS256"
  end

  def initialize(registration)
    @registration = registration
  end

  def encoded
    JWT.encode({ "sub" => registration.id }, self.class.secret, self.class.algorithm)
  end
end
