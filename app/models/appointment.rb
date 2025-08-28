class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :doctor_id, :patient_id, :scheduled_date, presence: true
end
