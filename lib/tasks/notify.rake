desc 'Notify customers by SMS'
task :notify => :environment do
  Appointment.notify!
end

desc 'Receive reponses by SMS'
task :receive => :environment do
  Appointment.receive!
end
