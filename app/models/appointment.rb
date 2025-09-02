class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  enum status: { scheduled: "scheduled", completed: "completed", cancelled: "cancelled" }

  validates :doctor_id, :patient_id, :scheduled_at, :status, :notes, presence: true
end
