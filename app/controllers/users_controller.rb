class UsersController < ApplicationController
  skip_forgery_protection
  before_action :authenticate, except: [:new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      login(@user)
      redirect_to root_path, notice: "Account Created."
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
