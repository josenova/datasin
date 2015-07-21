class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :sector
      t.references :city, index: true

      t.timestamps null: false
    end
    add_foreign_key :sectors, :cities
  end
end
