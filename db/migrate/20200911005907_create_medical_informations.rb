class CreateMedicalInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_informations do |t|
      t.string :nss
      t.string :blod_type
      t.string :allergies
      t.string :donor
      t.references :user_information, foreign_key: true

      t.timestamps
    end
  end
end
