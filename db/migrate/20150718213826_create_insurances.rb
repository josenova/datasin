class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.string :company

      t.timestamps null: false
    end
  end
end
