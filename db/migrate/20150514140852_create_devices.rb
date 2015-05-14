class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :sim_id
      t.integer :user_id
      t.string :model_number
      t.string :name
      t.string :imei
      t.text :description

      t.timestamps null: false
    end
  end
end
