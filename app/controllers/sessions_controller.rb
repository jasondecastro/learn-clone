class SessionsController < ApplicationController
  before_action :authenticate, only: [:show]

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:user][:password])
    binding.pry
    if @user
      session[:user_id] = @user.id
      redirect_to track_path(@user.track)
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end
end
