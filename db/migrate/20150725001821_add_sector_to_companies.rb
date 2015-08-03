class AddSectorToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :sector, index: true
    add_foreign_key :companies, :sectors
  end
end
