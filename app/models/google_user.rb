class GoogleUser < ApplicationRecord
    valildates :mail, presence: true, uniquness: true
end
