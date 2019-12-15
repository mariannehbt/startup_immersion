class UserMailer < ApplicationMailer
  default from: 'startup.immersion.thp@gmail.com'

  def confirmation_newsletter(newsletter)
    @newsletter = newsletter 
    @url  = 'https://startup-immersion-production.herokuapp.com/' 
    mail(to: @newsletter.email, subject: 'Newsletter Startup Immersion') 
  end
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://startup-immersion-production.herokuapp.com/' 
    mail(to: @user.email, subject: 'Bienvenue chez Startup Immersion !') 
  end

  def apply_attendance(attendance)
    @attendance = attendance
    @url  = 'https://startup-immersion-production.herokuapp.com/' 
    mail(to: @attendance.user.email, subject: 'Pré-Inscription Startup Immersion') 
  end

  def confirmation_attendance(attendance)
    @attendance = attendance
    @url  = 'https://startup-immersion-production.herokuapp.com/' 
    mail(to: @attendance.user.email, subject: 'Invitation Startup Immersion !') 
  end
end
