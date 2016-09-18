




json.array!(@feeds) do |feed|
  json.extract! feed, :id, :title, :description, :department_id
  json.url user_feed_url(feed, format: :json)
end
