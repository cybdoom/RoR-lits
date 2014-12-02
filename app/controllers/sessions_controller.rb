class SessionsController < ApplicationController

  layout 'admin'

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_path
    else
      redirect_to login_path, alert: 'Invalid login or password'
     end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
