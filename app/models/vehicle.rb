class Vehicle < ActiveRecord::Base
  belongs_to :vehicle_model
  has_many :claims
  has_and_belongs_to_many :policies
  
  has_paper_trail
  
  before_validation do
    self.plate = plate.upcase
  end
  
  #validates :vin, presence: true, uniqueness: true
  #validates :plate, presence: true, uniqueness: true
  
end
