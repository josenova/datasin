class CreatePoliciesVehicles < ActiveRecord::Migration
  def change
    create_table :policies_vehicles , :id => false do |t|
      t.belongs_to :policy, index: true
      t.belongs_to :vehicle, index: true
    end
  end
  
  
end
