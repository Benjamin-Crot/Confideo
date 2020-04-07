class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.references :profile, null: false, foreign_key: true
      t.date :from_date
      t.date :to_date
      t.time :from_time
      t.time :to_time
      t.integer :slot_time
      t.timestamps
    end
  end
end
