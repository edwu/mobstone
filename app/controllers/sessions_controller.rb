class SessionsController < ApplicationController
  def new
    @title = "Sign in"
    render 'new'
  end

  def create
    user = User.authenticate(params[:session][:email],
                           params[:session][:password])
    @title = "Sign in"
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      render 'new'
    elsif user.is_company?
      sign_in user
      redirect_to deals_path
    else
      sign_in user
      redirect_back_or root_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
