class Apartment < ApplicationRecord
  attr_accessor :name, :apartment_number

  belongs_to :condo

  has_many :users
  has_many :fees
end
