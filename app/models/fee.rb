class Fee < ApplicationRecord
  belongs_to :apartment
  belongs_to :user
end
