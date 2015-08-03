class AddPolicyToClient < ActiveRecord::Migration
  def change
  	add_reference :policies, :client, index: true
    add_foreign_key :policies, :clients
    
    add_reference :policies, :company, index: true
    add_foreign_key :policies, :companies
  end
end
