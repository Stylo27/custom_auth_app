class RegistrationsController < ApplicationController
  def new
  end

  def create
    user = User.create(registration_params)
    if user.save
      cookies.permanent[:auth_token] = user.auth_token
      flash[:success] = 'You are registered'
      redirect_to root_path
    else
      flash.now[:error] = user.errors.full_messages
      render 'new'
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:email, :name, :password, :password_confirmation)
  end
end
