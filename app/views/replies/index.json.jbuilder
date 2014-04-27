json.array!(@replies) do |reply|
  json.extract! reply, :id, :post_id, :body
  json.url reply_url(reply, format: :json)
end
