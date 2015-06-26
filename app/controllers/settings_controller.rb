class SettingsController < ApplicationController
  include Authenticated

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to :settings, notice: 'Usuário alterado com sucesso'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :business)
  end
end
