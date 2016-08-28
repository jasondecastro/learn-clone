class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to register_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end