class Startup < ApplicationRecord
  has_many :events

  validates_uniqueness_of :name

  validates :name,
  presence: true

  validates :catch_phrase,
  presence: true

  validates :website_url,
  presence: true

  validates :description,
  presence: true

  has_one_attached :startup_picture
end
