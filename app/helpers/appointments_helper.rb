module AppointmentsHelper
  def status_stylesheet(appointment)
    case appointment.status
    when 'unknown'
      nil
    when 'waiting'
      'list-group-item-warning'
    when 'confirmed'
      'list-group-item-success'
    when 'canceled'
      'list-group-item-danger'
    end
  end
end
