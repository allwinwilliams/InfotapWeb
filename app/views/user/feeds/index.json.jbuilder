




json.array!(@feeds) do |feed|
  json.extract! feed, :id, :title, :description, :department_id
  json.url feed_url(feed,[:id], format: :json)
end
