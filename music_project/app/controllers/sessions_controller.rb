class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:users][:email],
      params[:users][:password]
    )

    if user.nil?
      flash.now[:errors] = ['Invalid login credentials']
      render :new
    else
      login!(user)
      redirect_to user_url(user)
    end
  end

  def new
    render :new
  end

  def destroy
    logout!(current_user)
    redirect_to new_session_url
  end

end
