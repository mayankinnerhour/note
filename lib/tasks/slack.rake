# require 'httparty'
# require 'dotenv/tasks'

# namespace :slack do
#   desc "Send minutes reminder to create a note in Slack"
#   task run_notifications: :environment do
#     HTTParty.post(ENV["WEBHOOK_URL"], :body => {
#       :channel  => '#mayank-notifications-test',
#       :username => 'mayankbot',
#       :text     => 'Time to create a note."'
#     }.to_json)
#   end
  
#   every 10.minutes do
#     rake "slack:run_notifications"
#   end

# end
