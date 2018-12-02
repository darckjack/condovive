class User < ApplicationRecord
  attr_accessor :name, :email, :phone
  belongs_to :apartment
end
