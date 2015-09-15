class ChangeRncDataType < ActiveRecord::Migration
  def change
    change_column :companies, :rnc, :string
  end
end
