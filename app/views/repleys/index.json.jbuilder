json.array!(@repleys) do |repley|
  json.extract! repley, :id
  json.url repley_url(repley, format: :json)
end
