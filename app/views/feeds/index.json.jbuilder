json.array!(@feeds) do |feed|
  json.extract! feed, :title, :description, :department
  json.url feed_url(feed, format: :json)
end
