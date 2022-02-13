class SessionsController < ApplicationController
  include FlashHelper

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:return_to].present?
        redirect_to session[:return_to]
      else
        redirect_to root_path
      end
    else
      register_flash_now_message(:alert,
                                 'Are you a Guru? Verify your email and password, please')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
