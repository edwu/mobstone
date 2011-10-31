class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    user = User.authenticate(params[:session][:email],
                           params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    elsif user.is_company?
      sign_in user
      redirect_to company_deals_path
    else
      sign_in user
      redirect_back_or profile_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
