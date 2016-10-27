class User < ApplicationRecord
	has_many :results
	has_many :activities
end
