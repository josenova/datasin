class Policy < ActiveRecord::Base
  belongs_to :insurance
  belongs_to :client
  belongs_to :company
  has_many :claims
  has_and_belongs_to_many :vehicles

  has_paper_trail
end
