json.array!(@scales) do |scale|
  json.extract! scale, :id, :date, :type_scale
  json.url scale_url(scale, format: :json)
end
