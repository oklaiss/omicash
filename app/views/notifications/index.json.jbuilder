json.array!(@notifications) do |notification|
  json.extract! notification, :id, :name, :message_text, :phone_number, :email, :duration, :frequency, :user_id, :is_active, :last_sent
  json.url notification_url(notification, format: :json)
end
