class RemindUserToFinishApplyingWorker
  include Sidekiq::Worker

  def perform(registration_id)
    return unless should_remind_user?

    registration = Registration.find(registration_id)

    Registration.transaction do
      registration.update(reminded_to_finish_applying: true)
      RegistrationMailer.remind_registration_to_finish_applying_email(registration).deliver_now
    end
  end

  private

  def should_remind_user?
    true # TODO
  end
end
