# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => api_key,
  :password => secret_key,
  :domain => 'start-up-immersion',
  :address => 'in-v3.mailjet.com',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
