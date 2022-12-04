class GoogleUser < ApplicationRecord
	validates :mail, presence: true, uniqueness: true
end
