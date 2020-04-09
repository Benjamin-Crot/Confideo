class CreateTimeslots < ActiveRecord::Migration[6.0]
  def change
    create_table :timeslots do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.references :reason, foreign_key: true
      t.date :date
      t.time :from_time
      t.time :to_time
      t.timestamps
    end
  end
end
