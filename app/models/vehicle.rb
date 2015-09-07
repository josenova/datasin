class Vehicle < ActiveRecord::Base
  belongs_to :vehicle_model
  belongs_to :policy
  has_many :claims
  
  has_paper_trail
  
  #validates :vin, presence: true, uniqueness: true
  #validates :plate, presence: true, uniqueness: true
  
end
