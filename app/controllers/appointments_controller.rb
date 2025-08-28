class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]
  before_action :set_patient, only: %i[index new create]
  before_action :set_doctor, only: [:index]

  # Handles both /appointments and /patients/:patient_id/appointments
  def index
    if @patient
      @appointments = @patient.appointments
    elsif @doctor
      @appointments = @doctor.appointments
    else
      @appointments = Appointment.all
    end
  end

  # GET /appointments/1
  def show
  end

  # GET /appointments/new or /patients/:patient_id/appointments/new
  def new
    @appointment = @patient ? @patient.appointments.build : Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /patients/:patient_id/appointments
  def create
    @appointment = @patient ? @patient.appointments.build(appointment_params) : Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
  end

  private

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id]) if params[:patient_id]
    end

    def set_doctor
      @doctor = Doctor.find(params[:doctor_id]) if params[:doctor_id]
    end

    def appointment_params
      params.require(:appointment).permit(:patient_id, :doctor_id, :scheduled_date)
    end
end
