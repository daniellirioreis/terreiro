class Event < ActiveRecord::Base
  validates_presence_of :name
  has_many :event_patients, dependent: :destroy
  
  has_enumeration_for :status_event, with: StatusEvent, create_helpers: true
	
  def to_s
    name
  end
  
  def value_paid
    event_patients.by_status_event_patient(StatusEventPatient::PAID).count * price
  end
  def value_paid
    event_patients.by_status_event_patient(StatusEventPatient::PAID).count * price
  end  
  def value_pending
    event_patients.by_status_event_patient(StatusEventPatient::PENDING).count * price      
  end
  def value_to_reclaim
    event_patients.count * price
  end
  
end
