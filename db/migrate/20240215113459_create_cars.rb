class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :photo
      t.text :details
      t.string :city
      t.string :model
      t.decimal :cost
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
