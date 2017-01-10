class Category < ApplicationRecord
  has_many :lessons
  has_many :words, dependent: :destroy
  accepts_nested_attributes_for :words, reject_if: lambda { |a| a[:word].blank? }, allow_destroy: true
  validates :name, presence: true, length: {minimum: Settings.category_name_min_length}
  validates :description, presence: true, length: {minimum: Settings.category_des_min_length}
end
