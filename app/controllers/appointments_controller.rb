class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.includes(:doctor, :patient).order(scheduled_at: :asc)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: "Appointment created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def show; end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: "Appointment updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: "Appointment deleted."
  end

  def calendar
    @appointments = Appointment.all
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :scheduled_at, :status, :notes)
  end
end
