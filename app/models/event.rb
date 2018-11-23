class Event < ActiveRecord::Base
  validates_presence_of :name
  has_many :event_patients, dependent: :destroy
  
	
  def to_s
    name
  end
  
  def value_paid
    event_patients.by_status_event_patient(StatusEventPatient::PAID).count * price
  end
end
