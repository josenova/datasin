class CreateClaimStatuses < ActiveRecord::Migration
  def change
    create_table :claim_statuses do |t|
      t.string :status

      t.timestamps null: false
    end
  end
end
