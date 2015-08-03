class AddPolicyToVehicles < ActiveRecord::Migration
  def change
    add_reference :vehicles, :policy, index: true
    add_foreign_key :vehicles, :policies
  end
end
