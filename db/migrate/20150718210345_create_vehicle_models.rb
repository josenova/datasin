class CreateVehicleModels < ActiveRecord::Migration
  def change
    create_table :vehicle_models do |t|
      t.string :model
      t.references :vehicle_brand, index: true

      t.timestamps null: false
    end
    add_foreign_key :vehicle_models, :vehicle_brands
  end
end
