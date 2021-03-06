class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :start_date
      t.date :end_date
      t.references :car, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
