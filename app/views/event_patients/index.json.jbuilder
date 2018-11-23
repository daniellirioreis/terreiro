json.array!(@event_patients) do |event_patient|
  json.extract! event_patient, :id, :event_id, :status_event_patient
  json.url event_patient_url(event_patient, format: :json)
end
