#!/usr/bin/env ruby

require "discordrb"

def read_parameters()
  return content = JSON.parse(File.read("env.json"))
end


def waiting_send(bot, channels)
  # Wait the time before sending the message
    channels.each do |channel|
        chan = channel["channel"]
        message = channel["message"]
        wait = channel["sleep_time"]
        puts "I'm now waiting \033[92m#{wait}\033[0m secondes."
        sleep(wait)   
        bot.send_message(chan, message)
    end
end

# Read secrets value
token = JSON.parse(File.read("secrets.json"))["discord"]
# Create the bot
bot = Discordrb::Bot.new(token: token)
bot.run(background: true)
puts "I'm logged in, this is my invite link \033[5:31m→\033[0m \033[93m#{bot.invite_url}\033[0m \033[5:31m←\033[0m"


# The infinite loop of the bot
channels = read_parameters()

while true
    # Read the configuration, it may change
    puts channels
    # Waid and send the message
    waiting_send(bot, channels)
end
