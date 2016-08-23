class AddCarAvailabilityColumn < ActiveRecord::Migration
  def change
     add_column :cars, :availability, :string
     add_index :cars, :availability
  end
end
