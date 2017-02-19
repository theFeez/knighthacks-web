class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      # TODO
      head :ok
    else
      # TODO
      head :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :full_name,
      :email,
      :phone,
      :shirt_sex,
      :shirt_size,
    )
  end
end
