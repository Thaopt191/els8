class Word < ApplicationRecord
  belongs_to :category
  belongs_to :lesson
  has_many :results
  has_many :answers, dependent: :destroy
end
