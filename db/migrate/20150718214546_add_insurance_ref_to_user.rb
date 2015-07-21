class AddInsuranceRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :insurance, index: true
    add_foreign_key :users, :insurances
    
    add_column :users, :level, :integer, default: 0
  end
end
