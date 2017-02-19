class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i(update)
  before_action :find_user, only: %i(edit update)

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to apply_redirect_path
    else
      render :edit
    end
  end

  def edit
    @registration_form = RegistrationForm.new(@user, params[:section])
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.details, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find_by(id: session[:user_id]) || User.new
  end

  def user_params
    params.require(:user).permit(
      :full_name,
      :email,
      :phone,
      :shirt_fit_sex,
      :shirt_fit_size,
      :university_name,
      :major,
      :university_email,
      :expected_graduation,
      :born_on,
    )
  end
end
