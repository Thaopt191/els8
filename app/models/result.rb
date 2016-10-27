class Result < ApplicationRecord
	belongs_to :user
	belongs_to :lesson
	belongs_to :word
end
