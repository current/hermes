class UsersController < ApplicationController
  include Public

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      warden.set_user(@user)
      redirect_to :today
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :business)
  end
end
