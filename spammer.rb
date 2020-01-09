#!/usr/bin/env ruby

require "discordrb"

def read_parameters()
  content = JSON.parse(File.read("env.json"))
  return content["channel"], content["message"], content["sleep_time"].to_i
end


def waiting_send(bot, channel, message, wait)
  # Wait the time before sending the message
  puts "I'm now waiting #{wait} secondes."
  sleep(wait)

  # Browse the list of server we are
  bot.servers.each do |serv_id, serv|
    # Browse channels on a server
    serv.channels.each do |chan|
      # If the channel have the good name, we send the message
      if channel == chan.name
        # Send message
        puts "I'm sending the message `#{message}` the the channel #{chan.name} of the server #{serv.name}"
        bot.send_message(chan, message)

        # Don't break, it may have multilple channels with the same name
      end
    end

  end
end


# Read secrets value
token = JSON.parse(File.read("secrets.json"))["discord"]
# Create the bot
bot = Discordrb::Bot.new(token: token)
bot.run(background: true)
puts "I'm logged in, this is my invite link → #{bot.invite_url} ←"

# The infinite loop of the bot
while true
  # Read the configuration, it may change
  channel, message, wait = read_parameters()

  # Waid and send the message
  waiting_send(bot, channel, message, wait)
end
