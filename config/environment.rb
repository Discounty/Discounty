# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Rubaidh::GoogleAnalytics.tracker_id = 'UA-71655846-1'
