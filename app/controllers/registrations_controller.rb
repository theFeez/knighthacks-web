class RegistrationsController < ApplicationController
  before_action :find_user

  def resume
    session[:user_id] = @user.id

    head :ok
  end

  private

  def find_user
    @user = User.find_by!(registration_token: params[:token])
  end
end
