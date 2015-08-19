class Claim < ActiveRecord::Base
  belongs_to :policy
  belongs_to :vehicle
  belongs_to :claim_type
  belongs_to :claim_status
  
  has_paper_trail
end
