class Fee < ApplicationRecord
  # note that the amount is represented in cents so, the field can only store integers
  validates :amount, presence: true, numericality: { only_integer: true }

  belongs_to :apartment
  belongs_to :user, optional: true
end
