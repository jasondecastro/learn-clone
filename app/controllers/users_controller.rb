require 'pony'
class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]

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
    @user.track = Track.all.first
    if @user.save
      session[:user_id] = @user.id

      Pony.mail({
      :to => @user.email,
      :via => :smtp,
      :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => 'no.reply.zoltar@gmail.com',
          :password             => 'zoltar123',
          :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
        },
        :from => 'no.reply.zoltar@gmail.com',
        :subject => 'Thanks for signing up to Learn.',
        :body => "Here's your fortune below. I'll see you again when the night is dark and full of terrors."
      })

      redirect_to user_path(@user)

    else
      redirect_to signup_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end
