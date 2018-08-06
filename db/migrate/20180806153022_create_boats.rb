class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :address
      t.string :description
      t.integer :stars
      t.integer :price
      t.string :model
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
