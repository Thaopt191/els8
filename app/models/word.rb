class Word < ApplicationRecord
  belongs_to :category
  belongs_to :lesson
  has_many :results
end
