desc 'Notify customers by SMS'
task :notify => :environment do
  Appointment.notify!
end
