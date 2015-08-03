class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :identification
      t.boolean :gender
      t.date :birthdate
      t.text :address
      t.string :occupation
      t.references :sector, index: true

      t.timestamps null: false
    end
    add_foreign_key :clients, :sectors
  end
end
