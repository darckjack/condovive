class Apartment < ApplicationRecord
  belongs_to :condo

  has_many :users
  has_many :fees
end
