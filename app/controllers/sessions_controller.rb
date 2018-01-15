class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'You are signed'
      redirect_to root_path
    else
      flash[:error] = 'Incorrect email or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logout'
    redirect_to root_path
  end
end
