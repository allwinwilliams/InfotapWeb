json.array!(@feeds) do |feed|
  json.extract! feed, :id, :title, :description, :department_id
  json.url admin_feed_url(feed, format: :json)
end
