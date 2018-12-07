class Apartment < ApplicationRecord
  validates :name, presence: true
  validates :apartment_number, presence: true

  belongs_to :condo

  has_many :users
  has_many :fees
end
