class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :situation, optional: true
  belongs_to :activity, optional: true
  belongs_to :newsletter, optional: true
  has_many :attendances
  has_many :events, through: :attendances
end
