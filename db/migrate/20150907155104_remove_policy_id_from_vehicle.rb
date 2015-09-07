class RemovePolicyIdFromVehicle < ActiveRecord::Migration
  def change
    remove_foreign_key :vehicles, column: :policy_id
  end
end
