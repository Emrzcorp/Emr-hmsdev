class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :set_doctors, only: [:new, :create, :edit, :update]

  def index
    @q = params[:q].to_s.strip
    scope = Patient.with_attached_documents.includes(:doctor)
    scope = scope.where("first_name ILIKE :q OR last_name ILIKE :q OR email_address ILIKE :q", q: "%#{@q}%") if @q.present?
    scope = scope.where(doctor_id: params[:doctor_id]) if params[:doctor_id].present?
    @patients = scope.order(updated_at: :desc).page(params[:page])
  end

  def show; end
  def new;  @patient = Patient.new end
  def edit; end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: "Patient account created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: "Patient account updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: "Patient account deleted successfully."
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def set_doctors
    @doctors = Doctor.order(:last_name, :first_name)
  end

  def patient_params
    params.require(:patient).permit(
      :first_name, :middle_name, :last_name, :date_of_birth, :medical_history,
      :emergency_contact, :status, :gender, :email_address, :phone_number,
      :current_medications, :insurance_information, :allergies, :address_1,
      :address_2, :city, :state, :country, :zip_code, :active, :doctor_id,
      documents: []
    )
  end
end
