class Condo < ApplicationRecord
  attr_accessor :name, :address

  has_many :apartments, dependent: :destroy
end
