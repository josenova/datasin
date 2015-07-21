class Insurance < ActiveRecord::Base
	has_many :policies
	has_many :users
end
