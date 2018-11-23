json.array!(@events) do |event|
  json.extract! event, :id, :name, :price, :date_start, :date_end
  json.url event_url(event, format: :json)
end
