class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.references :doctor, null: false, foreign_key: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.text :medical_history
      t.string :emergency_contact
      t.string :status
      t.string :gender
      t.string :email_address
      t.string :phone_number
      t.text :current_medications
      t.string :insurance_information
      t.text :allergies
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.boolean :active

      t.timestamps
    end
  end
end
