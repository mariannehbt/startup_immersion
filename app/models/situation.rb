class Situation < ApplicationRecord
  has_many :users

  validates_uniqueness_of :title

  validates :title,
  presence: true
end
