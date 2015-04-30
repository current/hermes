Dado(/^que há uma notificação para às "(.*?)"$/) do |time|
  @notification = Notification.create(body: 'Hello World!', trigger_at: Time.parse(time))
end

Dado(/^que a notificação será por SMS$/) do
  @notification.mobiles.create(number: '+55-11-987654321')
end

Quando(/^for "(.*?)"$/) do |time|
  Timecop.travel(Time.parse(time))
  Notification.run!
end

Então(/^o cliente foi notificado$/) do
  expect(@notification.reload).to be_done
end

Então(/^o cliente foi notificado via SMS$/) do
end