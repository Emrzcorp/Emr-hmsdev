class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_doctor, only: [:edit, :show, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path, notice: "Doctor account created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctors_path, notice: "Doctor account updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @doctor.destroy
      redirect_to doctors_path, notice: "Doctor account deleted successfully."
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])  
  end

  def doctor_params
    params.require(:doctor).permit(
      :first_name,
      :middle_name,
      :last_name,
      :specialty,
      :license_number,
      :email,
      :phone_number,
      :address_1,
      :address_2,
      :city,
      :state,
      :country,
      :zip_code
    )
  end
end
