json.array!(@messages) do |message|
  json.extract! message, :id, :sender_id, :receiver_id, :subject, :content
  json.url message_url(message, format: :json)
end
