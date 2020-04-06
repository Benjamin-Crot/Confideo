class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :profession
      t.string :description
      t.string :link
      t.integer :star
      t.timestamps
    end
  end
end
