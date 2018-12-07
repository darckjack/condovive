class User < ApplicationRecord
  enum role: [:admin, :resident]
  has_secure_password

  belongs_to :apartment, optional: true

  after_initialize do
    if self.new_record?
      self.role ||= :resident
    end
  end
end
