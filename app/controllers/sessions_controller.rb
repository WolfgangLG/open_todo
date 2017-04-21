class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password_digest])
      create_session(user)
    else
      render :json
    end
  end

  def destroy
    destroy_session(current_user)
  end
end
