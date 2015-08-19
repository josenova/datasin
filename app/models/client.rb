class Client < ActiveRecord::Base
  belongs_to :sector
  has_many :policies
  
  has_paper_trail
end
