class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.references :user, index: true
      t.string :client_query
      t.string :vehicle_query

      t.timestamps null: false
    end
    add_foreign_key :searches, :users
  end
end
