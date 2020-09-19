class Product < ApplicationRecord
	has_many :children, class_name: Product.name, foreign_key: "parent_id", dependent: :destroy
	belongs_to :parent, class_name: Product.name, optional: true		
  	belongs_to :user
  	has_one :brand
  	has_one :type
  	has_one :group
  	has_one :usage
  	has_one :modelyear
  	has_many :options

	validates :name, presence: true, uniqueness: true

	scope :all_category, -> {
		select(:id, :name).where(parent_id: nil)
	}

	scope :load_all, -> {
		where("parent_id IS NOT NULL")
	}

	def descendants
	  	self.children | self.children.map(&:descendants).flatten
	end	
end
