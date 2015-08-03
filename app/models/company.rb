class Company < ActiveRecord::Base
  belongs_to :sector
  has_many :policies
end
