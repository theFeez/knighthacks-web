class UsersController < ApplicationController
  before_action :find_user, only: %i(edit)

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
    @section = params[:section]
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
    )
  end
end
