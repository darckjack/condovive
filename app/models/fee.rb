class Fee < ApplicationRecord
  validates :amount, presence: true, numericality: { only_integer: true }

  belongs_to :apartment
  belongs_to :user, optional: true
end
