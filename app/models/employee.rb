class Employee < ApplicationRecord
	belongs_to :department
	validates :name,:email,:mobile,:department_id,:presence=>true
	validates :mobile,:numericality=>true,:uniqueness=>true
	validates :department_id,:numericality=>true
end
