class Site < ApplicationRecord
  validates :customer, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :content, presence: true
  validates :construction_date, presence: true
  validates :progress, presence: true
  validates :check, presence: true
end
