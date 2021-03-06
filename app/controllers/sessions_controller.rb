class SessionsController < ApplicationController
  before_action :authorize, except: :new

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end
end
