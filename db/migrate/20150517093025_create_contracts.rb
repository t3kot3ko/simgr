class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :from_sim_id
      t.integer :to_sim_id
      t.date :processed_at
      t.text :description
      t.integer :user_id
      t.string :type

      t.timestamps null: false
    end
  end
end
