json.array!(@messages) do |message|
  json.extract! message, :id, :subject, :content
  json.url message_url(message, format: :json)
end
