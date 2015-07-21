class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.string :policy
      t.boolean :type
      t.references :insurance, index: true

      t.timestamps null: false
    end
    add_foreign_key :policies, :insurances
  end
end
