class Startup < ApplicationRecord
  has_many :events

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
