class EventPatient < ActiveRecord::Base
  belongs_to :event
  belongs_to :patient
  has_enumeration_for :status_event_patient, with: StatusEventPatient, create_helpers: true
  validate :was_present_at_the_previous_event?

  scope :by_status_event_patient, lambda { |status| where("event_patients.status_event_patient = ?", status)}
  scope :sorted, -> { order("patients.name").joins(:patient) }
  

  def to_s
    patient
  end
  private

  def was_present_at_the_previous_event?
    previous_event = Event.find_by_id(event.id - 1)
    unless previous_event.nil? 
      if patient.participating(previous_event.id )
        errors.add(:status_event_patient, "estava presente no evento anterior, não é possível finalizar") 
      end 
    end
  end

end
