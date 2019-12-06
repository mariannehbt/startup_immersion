class User < ApplicationRecord
  belongs_to :situation, optional: true
  belongs_to :activity, optional: true
  belongs_to :newsletter, optional: true
  has_many :attendances
  has_many :events, through: :attendances
end
