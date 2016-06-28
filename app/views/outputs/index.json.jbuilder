json.array!(@outputs) do |output|
  json.extract! output, :id, :date_output, :description, :member_id
  json.url output_url(output, format: :json)
end
