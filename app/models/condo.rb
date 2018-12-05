class Condo < ApplicationRecord
  has_many :apartments, dependent: :destroy
end
