class Vehicle < ActiveRecord::Base
  belongs_to :vehicle_model
  belongs_to :policy
  has_many :claims
end
