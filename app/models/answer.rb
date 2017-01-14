class Answer < ApplicationRecord
  belongs_to :word
  validates :answer, presence: true
end
