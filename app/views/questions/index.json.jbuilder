json.array!(@questions) do |question|
  json.extract! question, :id
end
