json.array!(@selections) do |selection|
  json.extract! selection, :id, :tag_id, :feeder_id
  json.url selection_url(selection, format: :json)
end
