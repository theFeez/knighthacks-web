class RemindUserToFinishApplyingWorker
  include Sidekiq::Worker

  def perform(user_id)
    return unless should_remind_user?

    user = User.find(user_id)

    User.transaction do
      user.update(reminded_to_finish_applying: true)
      UserMailer.remind_user_to_finish_applying_email(user).deliver_now
    end
  end

  private

  def should_remind_user?
    true # TODO
  end
end
