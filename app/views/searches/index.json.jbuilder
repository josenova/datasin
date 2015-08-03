json.array!(@searches) do |search|
  json.extract! search, :id, :user_id, :client_query, :vehicle_query
  json.url search_url(search, format: :json)
end
