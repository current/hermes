class RepliesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @appointment = Appointment.find_by(uuid: params[:idMT])
    @appointment.parse(params[:msg])

    head :ok
  end
end
