class DashboardController < ApplicationController
  before_action :authenticate_user!
  def show
    @doctor_count    = Doctor.count
    @patient_count   = Patient.count
    @today_appts     = Appointment.where(scheduled_at: Time.zone.today.all_day).count
    #@open_encounters = Encounter.where(status: "open").count
    #@unread_docs     = DocumentReceipt.where(user: current_user, read_at: nil).count rescue 0
  end
end
