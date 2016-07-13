json.array!(@reminders) do |reminder|
  json.extract! reminder, :id, :title, :subtitle, :color_title, :color_subtitle, :image, :description
  json.url reminder_url(reminder, format: :json)
end
