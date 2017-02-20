class UsersController < ApplicationController
  REMIND_USER_TO_FINISH_APPLYING_AFTER = ENV.fetch("REMIND_USER_TO_FINISH_APPLYING_AFTER")

  skip_before_action :verify_authenticity_token, only: %i(update)

  def create
    @user = User.new(user_params)

    if @user.save
      RemindUserToFinishApplyingWorker.perform_in(remind_user_in, @user.id)
      session[:user_id] = @user.id
      redirect_to apply_redirect_path
    else
      render :edit
    end
  end

  def edit
    @registration_form = RegistrationForm.new(current_user, params[:section])
  end

  def update
    if current_user.update(user_params)
      render json: current_user
    else
      render json: current_user.errors.details, status: :unprocessable_entity
    end
  end

  def resume_application
    user = RegistrationToken.user_for(params[:registration_token])
    session[:user_id] = user.id

    redirect_to apply_redirect_path
  end

  private

  def user_params
    params.require(:user).permit(
      :additional_portfolio,
      :additional_remarks,
      :born_on,
      :email,
      :event_expectations,
      :expected_graduation,
      :full_name,
      :gender,
      :github,
      :interests,
      :linkedin,
      :major,
      :number_of_hackathons,
      :phone,
      :proud_project,
      :race,
      :shirt_fit_sex,
      :shirt_fit_size,
      :tech_stack,
      :travel_accommodations_needed,
      :traveling_from_city,
      :traveling_to_city,
      :university_email,
      :university_name,
      :website,
      :why_mentor,
      availability: [],
      roles: [],
    )
  end

  def remind_user_in
    ActiveSupport::Duration.parse(REMIND_USER_TO_FINISH_APPLYING_AFTER)
  end
end
