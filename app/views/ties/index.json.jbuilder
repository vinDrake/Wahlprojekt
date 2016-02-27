json.array!(@ties) do |tie|
  json.extract! tie, :id, :question_id, :tag_id
  json.url ty_url(tie, format: :json)
end
