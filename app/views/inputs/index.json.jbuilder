json.array!(@inputs) do |input|
  json.extract! input, :id, :date_input, :description, :member_id
  json.url input_url(input, format: :json)
end
