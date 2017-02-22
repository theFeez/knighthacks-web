class RegistrationsController < ApplicationController
  REMIND_USER_TO_FINISH_APPLYING_AFTER = ENV.fetch("REMIND_USER_TO_FINISH_APPLYING_AFTER")

  skip_before_action :verify_authenticity_token, only: %i(update)
  before_action :find_registration, only: %i(resume)

  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      RemindUserToFinishApplyingWorker.perform_in(remind_user_in, @registration.id)
      session[:registration_id] = @registration.id
      redirect_to resume_registration_path
    else
      render :edit
    end
  end

  def edit
    @registration_form = RegistrationForm.new(current_registration, params[:section])
  end

  def update
    @registration_form = RegistrationForm.new(current_registration, params[:section])

    respond_to :js

    if current_registration.update(registration_params)
      render :update
    else
      render :update_error
    end
  end

  def resume
    if @registration
      session[:registration_id] = @registration.id
      redirect_to apply_path("basic")
    else
      redirect_to root_path
    end
  end

  private

  def find_registration
    if params[:registration_token]
      @registration = RegistrationToken.registration_for(params[:registration_token])
    elsif session[:registration_id]
      @registration = Registration.find(session[:registration_id])
    end
  end

  def remind_user_in
    ActiveSupport::Duration.parse(REMIND_USER_TO_FINISH_APPLYING_AFTER)
  end

  def registration_params
    params.require(:registration).permit(
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
end
