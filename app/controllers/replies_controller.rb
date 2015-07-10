class RepliesController < ApplicationController
  def create
    @appointment = Appointment.find_by(uuid: params[:idMT])
    @appointment.parse(params[:msg])

    head :ok
  end
end
