class CreateWeekAvaibilities < ActiveRecord::Migration[6.0]
  def change
    create_table :week_avaibilities do |t|

      t.timestamps
    end
  end
end
