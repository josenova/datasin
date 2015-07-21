class Vehicle < ActiveRecord::Base
  belongs_to :vehicle_model
  has_many :claims
end
