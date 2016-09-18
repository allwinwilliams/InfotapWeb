json.array!(@department.feeds) do |feed|
  json.extract! feed, :id, :title, :description
  json.url admin_feed_url(feed, format: :json)
end
