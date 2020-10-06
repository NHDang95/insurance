class User < ApplicationRecord
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable, :rememberable, :validatable

  	has_many :articles
    has_one :product
  	validates_presence_of :name
  	validates_presence_of :phone
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: { with:VALID_EMAIL_REGEX },
    	uniqueness: {case_sensitive: false}

    scope :find_user, -> {
      where(admin: false)
    }
end