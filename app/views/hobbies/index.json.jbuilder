json.array!(@hobbies) do |hobby|
  json.extract! hobby, :id, :name
  json.url hobby_url(hobby, format: :json)
end
