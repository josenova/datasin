class Company < ActiveRecord::Base
  belongs_to :sector
  has_many :policies
  
  has_paper_trail
  
  validates :name, presence: true, length: { minimum: 2, maximum: 60 }
  
  validates :rnc, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 9 }

  

end
