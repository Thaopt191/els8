class Category < ApplicationRecord
	has_many :lessons
	has_many :words
	before_save 
		VALID_NAME_REGEX = /\A+[a-z]+[\w+\-.]+\z/i
		validates :name, presence: true, length: { maximum: 50, minimum: 4 },
											format:{ with: VALID_NAME_REGEX }, 
											uniqueness: { case_sensitive: false }
		validates :description, presence: true, length: { maximum: 255, minimum: 6 }
end
