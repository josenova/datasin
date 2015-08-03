class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :rnc
      t.text :address

      t.timestamps null: false
    end
  end
end
