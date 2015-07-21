class Sector < ActiveRecord::Base
  belongs_to :city
  has_many :clients
end
