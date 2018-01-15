class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      cookies.permanent[:auth_token] = user.auth_token
      flash[:success] = 'You are signed'
      redirect_to root_path
    else
      flash[:error] = 'Incorrect email or password'
      redirect_to login_path
    end
  end

  def destroy
    cookies.delete(:auth_token)
    flash[:notice] = 'Logout'
    redirect_to root_path
  end
end
