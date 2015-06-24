class SessionsController < ApplicationController
  def create
    if warden.authenticate
      redirect_to :appointments
    else
      flash.alert = warden.message
      redirect_to :login
    end
  end

  def destroy
    warden.logout
    redirect_to :login
  end
end
