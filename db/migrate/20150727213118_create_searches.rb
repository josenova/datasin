class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.references :user, index: true
      t.string :client
      t.string :vehicle

      t.timestamps null: false
    end
    add_foreign_key :searches, :users
  end
end
