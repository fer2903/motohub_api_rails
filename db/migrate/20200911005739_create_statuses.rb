class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :var_name
      t.string :flag

      t.timestamps
    end
  end
end
