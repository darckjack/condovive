class User < ApplicationRecord
  validates_presence_of :name, :email, :phone, :password_digest
  validates :email, uniqueness: true


  enum role: [:admin, :resident]
  has_secure_password

  belongs_to :apartment, optional: true

  after_initialize do
    if self.new_record?
      self.role ||= :resident
    end
  end
end
