class Newsletter < ApplicationRecord
  has_one :user

  validates_uniqueness_of :email

  validates :email,
  presence: true

  after_create :confirmation_newsletter_send
  def confirmation_newsletter_send
    UserMailer.confirmation_newsletter(self).deliver_now
  end

  after_create :check_user
  def check_user
    existing_user = User.find_by(email: self.email)
    if existing_user != nil
      existing_user.update!(newsletter: self)
    end
  end
end
