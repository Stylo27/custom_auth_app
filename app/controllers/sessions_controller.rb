class SessionsController < ApplicationController
  def new
  end

  def create
    byebug
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
