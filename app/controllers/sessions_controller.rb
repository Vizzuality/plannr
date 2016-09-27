class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if user.manages_projects?
        session[:user_id] = user.id
        redirect_to root_url, notice: "Logged in!"
      else
        redirect_to root_url,
          notice: "You are not authorized to login to this tool! Please check with the members of your team to have your account upgraded"
      end
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
