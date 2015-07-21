class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.references :vehicle_model, index: true
      t.integer :year
      t.string :vin
      t.string :plate

      t.timestamps null: false
    end
    add_foreign_key :vehicles, :vehicle_models
  end
end
