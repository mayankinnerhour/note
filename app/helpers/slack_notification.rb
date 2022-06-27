module SlackNotification
  require 'slack-notifier'
  
  def sendNotification(data = {})
    slack_data        =   data.as_json
    message           =   slack_data['message']  || ''
    # channel_name = slack_data['is_psychiatrist'] ? '#admin-notifications-psychiatry' : '#admin-notifications'
    # ap "slack notification goes here ===> " + message.to_s
    if Rails.env.development?
      $notifier = Slack::Notifier.new "https://hooks.slack.com/services/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", channel: '#mayank-notifications-test', username: 'mayankbot'
      $notifier.ping message
    end
  end

end