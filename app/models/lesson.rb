class Lesson < ApplicationRecord
  belongs_to :category
  has_many :activities
  has_many :words
  has_many :results

end
