class CreateMotorcycles < ActiveRecord::Migration[5.2]
  def change
    create_table :motorcycles do |t|
      t.references :state, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :status, foreign_key: true
      t.integer :yaer
      t.string :serial
      t.string :plates
      t.string :mileage
      t.string :invoice_number
      t.string :model
      t.string :description
      t.string :color
      t.string :image
      t.string :serial_image
      t.string :engine
      t.string :cilinder
      t.string :submarca
      t.string :insurance
      t.string :policy
      t.boolean :is_a_driver
      t.string :driver_name
      t.string :report_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
