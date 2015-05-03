json.array!(@notifications) do |notification|
  json.extract! notification, :id, :body, :trigger_at
  json.url notification_url(notification, format: :json)
end
