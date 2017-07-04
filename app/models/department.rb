class Department < ApplicationRecord
	has_many :employees

	validates :name,:uniqueness=>true,:presence=>true
	validates :created_by,:presence=>true
end
