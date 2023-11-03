class CreateEmergencyContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :emergency_contacts do |t|
      t.string :name
      t.string :relationship
      t.string :cel
      t.references :user_information, foreign_key: true

      t.timestamps
    end
  end
end
