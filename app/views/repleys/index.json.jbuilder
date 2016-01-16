json.array!(@repleys) do |repley|
  json.extract! repley, :id, :user_id, :question_id, :answer_id, :points
  json.url repley_url(repley, format: :json)
end
