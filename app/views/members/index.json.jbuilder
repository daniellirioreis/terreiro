json.array!(@members) do |member|
  json.extract! member, :id, :name, :birth_date, :phone
  json.url member_url(member, format: :json)
end
