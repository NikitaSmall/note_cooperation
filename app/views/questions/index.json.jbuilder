json.array!(@questions) do |question|
  json.extract! question, :id, :title, :text, :rating, :solved
  json.url question_url(question, format: :json)
end
