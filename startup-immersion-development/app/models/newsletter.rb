class Newsletter < ApplicationRecord
  has_one :user

  validates :email,
    presence: true

end
