json.array!(@elements) do |element|
  json.extract! element, :id, :challenge_id, :question_id
  json.url element_url(element, format: :json)
end
