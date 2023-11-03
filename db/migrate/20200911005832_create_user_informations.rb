class CreateUserInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_informations do |t|
      t.references :user, foreign_key: true
      t.string :full_name
      t.string :last_name
      t.string :address
      t.references :state, foreign_key: true
      t.integer :user_type
      t.integer :year_of_birth
      t.string :motoclub
      t.string :photo

      t.timestamps
    end
  end
end
