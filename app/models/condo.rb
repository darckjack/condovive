class Condo < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  has_many :apartments, dependent: :destroy
end
