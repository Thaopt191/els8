class Category < ApplicationRecord
  has_many :lessons
  has_many :words

  validates :name, presence: true, length: {minimum: Settings.category_name_min_length}
  validates :description, presence: true, length: {minimum: Settings.category_des_min_length}
end
