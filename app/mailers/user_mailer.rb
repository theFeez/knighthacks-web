class UserMailer < ApplicationMailer
  def remind_user_to_finish_applying_email(user)
    registration_token = RegistrationToken.new(user).encoded

    @user = user
    @resume_link = apply_resume_url(registration_token: registration_token)

    mail(
      to: user.email,
      subject: "Don't forget to finish up your KnightHacks application!",
    )
  end
end
