class RegistrationMailer < ApplicationMailer
  def remind_user_to_finish_applying_email(registration)
    registration_token = RegistrationToken.new(registration).encoded

    @registration = registration
    @resume_link = resume_registration_url(registration_token: registration_token)

    mail(
      to: registration.email,
      subject: "Don't forget to finish up your KnightHacks application!",
    )
  end
end
