class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.date :date
      t.string :number
      t.decimal :amount, precision: 8, scale: 2
      t.text :description
      t.references :policy, index: true
      t.references :client, index: true
      t.references :vehicle, index: true
      t.references :claim_type, index: true
      t.references :claim_status, index: true

      t.timestamps null: false
    end
    add_foreign_key :claims, :policies
    add_foreign_key :claims, :clients
    add_foreign_key :claims, :vehicles
    add_foreign_key :claims, :claim_types
    add_foreign_key :claims, :claim_statuses
  end
end
