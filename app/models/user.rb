class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :timeoutable, :lockable,
         :recoverable, :trackable, :validatable, :registerable
         
	belongs_to :insurance
end
