class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patients, only: [:edit, :show, :update, :destroy]
  before_action :set_doctors, only: [:new, :create, :edit, :update]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patients_path, notice: 'Patient account created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Patient account updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @patient.destroy
      redirect_to patients_path, notice: "Patient account deleted successfully."
    end
  end

  private

  def set_doctors
    @doctors = Doctor.all
  end

  def set_patients
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(
    :first_name,
    :middle_name,
    :last_name,
    :date_of_birth,
    :medical_history,
    :emergency_contact,
    :status,
    :gender,
    :email_address,
    :phone_number,
    :current_medications,
    :insurance_information,
    :allergies,
    :address_1,
    :address_2,
    :city,
    :state,
    :country,
    :zip_code,
    :active,
    :doctor_id,
    documents: []
    )
  end
end
