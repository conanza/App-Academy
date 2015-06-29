class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new

    if current_user
      flash[:notices] = ["please log out first"]
      redirect_to @user
    else
      render :new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
