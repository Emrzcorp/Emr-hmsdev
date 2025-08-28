class Patient < ApplicationRecord
  belongs_to :doctor

  has_many :appointments, dependent: :destroy
  has_many :medical_records, dependent: :destroy
  has_many_attached :documents

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  validates :first_name,
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
            presence: true
  def age
    return unless date_of_birth
    now = Time.zone.now.to_date
    now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
  end
end
