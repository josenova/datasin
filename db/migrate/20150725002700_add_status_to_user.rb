class AddStatusToUser < ActiveRecord::Migration
  def change
  remove_column :users, :level, :integer
  add_column :users, :active, :boolean, default: true
  end
end
