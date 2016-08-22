class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :license_plat
      t.decimal :fare, precision: 8, scale: 0

      t.timestamps null: false
    end
  end
end
