class Fee < ApplicationRecord
  attr_accessor :amount, :date, :paid
  belongs_to :apartment
  belongs_to :user
end
