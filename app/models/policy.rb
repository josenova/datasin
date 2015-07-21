class Policy < ActiveRecord::Base
  belongs_to :insurance
  has_many :claims
end
