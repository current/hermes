Dado(/^que há uma notificação para às "(.*?)"$/) do |time|
  @appointment = Appointment.create \
    name: 'John Doe',
    notified: false,
    begin_at: Time.parse(time) + 6.hours,
    area: '11', phone: '987654321'
end

Quando(/^for "(.*?)"$/) do |time|
  Timecop.travel(Time.parse(time))
  Appointment.notify!
end

Então(/^o cliente foi notificado$/) do
  expect(@appointment.reload).to be_notified
end
