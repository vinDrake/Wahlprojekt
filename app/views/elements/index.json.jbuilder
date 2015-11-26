json.array!(@elements) do |element|
  json.extract! element, :id
  json.url element_url(element, format: :json)
end
