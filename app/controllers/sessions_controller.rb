class SessionsController < ApplicationController
  include FlashHelper

  def new; end

  def create
    user = User.find_by(email: params[:email])
    puts params

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      register_flash_now_message(:alert,
                                 'Are you a Guru? Verify your email and password, please')
      render :new
    end
  end
end
