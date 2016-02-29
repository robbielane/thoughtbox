class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.email}"
      redirect_to links_path
    else
      flash.now[:error] = @user.errors.full_messages.join(' ')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
