class Event < ApplicationRecord
  belongs_to :startup
  has_many :attendances
  has_many :users, through: :attendances
end
