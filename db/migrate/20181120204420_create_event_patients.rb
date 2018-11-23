class CreateEventPatients < ActiveRecord::Migration
  def change
    create_table :event_patients do |t|
      t.references :event, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true
      
      t.integer :status_event_patient

      t.timestamps null: false
    end
  end
end
