class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :make
      t.string :model
      t.integer :year
      t.float :cost
      t.boolean :available, default: true
      t.string :photo_url

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
