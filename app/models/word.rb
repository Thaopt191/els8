class Word < ApplicationRecord
  belongs_to :category
  has_many :results
  has_many :answers
  accepts_nested_attributes_for :answers
end
