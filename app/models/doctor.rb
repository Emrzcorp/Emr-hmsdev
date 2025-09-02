class Doctor < ApplicationRecord
  has_many :patients, dependent: :destroy
  has_many :appointments, dependent: :destroy 

  def full_name
    # "#{first_name} #{middle_name} #{last_name}"
    [first_name, middle_name, last_name].compact.join(" ")
  end

  validates :first_name, :middle_name, :last_name, :specialty, :license_number, :address_1, :address_2, :city, :state, :country, :zip_code, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, numericality: true, length: { minimum: 10, maximum: 10 }
end
