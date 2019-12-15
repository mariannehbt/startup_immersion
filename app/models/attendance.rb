class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :motivation,
  presence: true,
  length: {in: 20..1000, message: ' must be between 20 and 1000 characters long'}

  validates :comment,
  presence: true,
  length: {in: 20..1000, message: ' must be between 20 and 1000 characters long'}

  after_create :apply_attendance_send
  def apply_attendance_send
  	UserMailer.apply_attendance(self).deliver_now
  end

  after_save :confirmation_attendance_send
  def confirmation_attendance_send
    if self.reviewed? && self.validated?
      UserMailer.confirmation_attendance(self).deliver_now
    end
  end
end
