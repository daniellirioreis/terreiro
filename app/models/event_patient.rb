class EventPatient < ActiveRecord::Base
  belongs_to :event
  belongs_to :patient
  has_enumeration_for :status_event_patient, with: StatusEventPatient, create_helpers: true

  scope :by_status_event_patient, lambda { |status| where("event_patients.status_event_patient = ?", status)}
  scope :sorted, -> { order(:name).joins(:patient) }
  

  def to_s
    patient
  end
end
