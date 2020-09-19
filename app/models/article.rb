class Article < ApplicationRecord
	belongs_to :user
  	mount_uploader :image, ImageUploader	

	scope :load_article, -> {
		where(order: :desc)
	}

	scope :time_created, -> {
		where (DateTime.now - created_at.to_date)
	}
end
