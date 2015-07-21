class CreateVehicleBrands < ActiveRecord::Migration
  def change
    create_table :vehicle_brands do |t|
      t.string :brand

      t.timestamps null: false
    end
  end
end
