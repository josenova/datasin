class Client < ActiveRecord::Base
  belongs_to :sector
  has_many :claims
end
