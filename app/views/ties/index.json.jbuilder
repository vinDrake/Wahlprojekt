json.array!(@ties) do |tie|
  json.extract! tie, :id
  json.url tie_url(tie, format: :json)
end
