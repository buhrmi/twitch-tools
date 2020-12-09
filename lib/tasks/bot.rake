# frozen_string_literal: true

# This simple bot responds to every "Ping!" message with a "Pong!"

require_relative '../irc'

namespace :twitch do
  desc 'Runs the Twitch bot'
  task bot: :environment do
    irc = IRC.new({
      server: 'irc.chat.twitch.tv',
      port: 6667,
      password: ENV['TWITCH_OAUTH_TOKEN'],
      nick: 'AuctionsBot'
    })

    logger = Logger.new(STDOUT)
    logger.info 'Connecting...'
    
    irc.on("connect") do
      logger.info 'Connected...'
      
      irc.join '#buhrmi_pewpew'
      irc.say '#buhrmi_pewpew', "Hello, I'm here. Visit https://auctionsbot.com to get started!"
    end
     
    irc.on('message') do |room, user, msg|

      match = msg.match(/^!(.+) (.+)/)
      cmd = match && match[1]
      param = match && match[2]

      if cmd == 'bid'
        user = User.from_twitch_name user
        irc.say room, "#{user.twitch_id} bid #{param}."
      end

      if cmd == 'extend'
        irc.say room, "The auction was extended by #{param} minutes."
      end
    end
    
    irc.connect
  end
end