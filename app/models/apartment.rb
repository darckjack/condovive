class Apartment < ApplicationRecord
  attr_accessor :name, :apartment_number

  belongs_to :condo
end
