class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  
  has_many :activities
  has_many :words
  has_many :results

end
