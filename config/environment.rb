# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Tardis::Application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
 :tls => true,
 :address => "smtp.163.com",
 :port => 25,
 :domain => "163.com",
 :authentication => :login,
 :user_name => "se_tardis_environment",
 :password => "goodhigh"
}
