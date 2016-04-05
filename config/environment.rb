# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'pusher_module'

Pusher.app_id = "180047"
Pusher.key = "a554079e030c74406aa4"
Pusher.secret = "d7b6590b1dbb37cecbf7"

# Initialize the Rails application.
Rails.application.initialize!
