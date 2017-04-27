class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      create_session(user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    destroy_session(current_user)
    redirect_to root_path
  end
end
