class CreateSims < ActiveRecord::Migration
  def change
    create_table :sims do |t|
      t.string :carrior
      t.string :number
      t.integer :valid
      t.date :registered_at
      t.string :imsi
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
