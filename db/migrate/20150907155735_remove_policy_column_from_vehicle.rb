class RemovePolicyColumnFromVehicle < ActiveRecord::Migration
  def change
    remove_column :vehicles, :policy_id
  end
end
