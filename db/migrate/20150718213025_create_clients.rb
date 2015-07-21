class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.integer :identification
      t.boolean :gender
      t.string :business_name
      t.integer :rnc
      t.date :birthdate
      t.text :address
      t.references :sector, index: true

      t.timestamps null: false
    end
    add_foreign_key :clients, :sectors
  end
end
