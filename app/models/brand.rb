class Brand < ApplicationRecord
	belongs_to :product
	has_many :types	
	accepts_nested_attributes_for :types
end
