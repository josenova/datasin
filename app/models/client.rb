class Client < ActiveRecord::Base
  belongs_to :sector
  has_many :policies
  
  has_paper_trail
  
  before_validation do
    self.name = name.strip.downcase.split.map(&:capitalize).join(" ") if name.present?
    self.surname = surname.strip.downcase.split.map(&:capitalize).join(" ") if surname.present?
    self.identification = identification.strip.gsub(/[^0-9]/, '') if identification.present?
  end

  
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }, format: { with: /\p{L}/ }
  validates :surname, presence: true, length: { minimum: 2, maximum: 50 }, format: { with: /\p{L}/ }
  
  validates :identification, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { is: 11 }
  

end
