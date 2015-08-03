class Sector < ActiveRecord::Base
  belongs_to :city
  has_many :clients
  has_many :companies
end
