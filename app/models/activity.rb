class Activity < ApplicationRecord
  has_many :users

  validates_uniqueness_of :name

  validates :name,
  presence: true
end
