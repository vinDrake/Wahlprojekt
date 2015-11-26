json.array!(@answers) do |answer|
  json.extract! answer, :id, :correct, :answer_body
  json.url answer_url(answer, format: :json)
end
