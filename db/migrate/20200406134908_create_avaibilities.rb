class CreateAvaibilities < ActiveRecord::Migration[6.0]
  def change
    create_table :avaibilities do |t|
      t.date :from_date
      t.date :to_date
      t.time :from_time
      t.time :to_time

      t.timestamps
    end
  end
end
