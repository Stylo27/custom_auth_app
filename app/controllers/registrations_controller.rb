class RegistrationsController < ApplicationController
  def new
  end

  def create
    @user = User.create(registration_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:email, :name, :password_digest)
  end
end
