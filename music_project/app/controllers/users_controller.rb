class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect :show
    else
      @user[:errors] = @user.errors.full_messages
    end
  end

  def new
    render :new
  end

  def user_params
    User.require(:user).permit(:email, :password)
  end
end
