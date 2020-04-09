class CreateReasons < ActiveRecord::Migration[6.0]
  def change
    create_table :reasons do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
