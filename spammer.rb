#!/usr/bin/env ruby

require "discordrb"

def read_parameters()
  return content = JSON.parse(File.read("env.json"))
end


def waiting_send(bot, channels)
  # Wait the time before sending the message
    ts = Time.now.to_i
    # Iterates through je JSON
    channels.each do |channel|
        chan = channel["channel"]
        message = channel["message"]
        sent = false
        # If emoji? sends an emoji of a message
        if message == "emoji?"
            bot.servers.each do |serv_id,serv| 
                # Picks a random emoji
                message = serv.emoji.to_a[rand(0..serv.emoji.size()-1)][1]
            end
        end
        # Reads the waiing time
        wait = channel["sleep_time"]
        # Check if function alreeady triggered once
        if channel["last_call"] == 0
            bot.send_message(chan, message)
            # Sets new TS for future reference
            channel["last_call"] = ts
            # Flag to check wheter message was sent for logs
            sent = !sent
        # Message already sent once
        elsif channel["last_call"] != 0
            # Message already sent, we check for differences of timestamps
            if ts >= (channel["last_call"] + channel["sleep_time"])
                bot.send_message(chan,message)
                # Sets new TS for future reference
                channel["last_call"] = ts
                # Flag to check whether the message was sent for logs
                sent = !sent
            end
        end
        # Prints waiting time
        if sent
            puts "I'm now waiting \033[92m#{wait}\033[0m secondes."
        end
    end
end

# Read secrets value
token = JSON.parse(File.read("secrets.json"))["discord"]
# Create the bot
bot = Discordrb::Bot.new(token: token)
bot.run(background: true)
puts "I'm logged in, this is my invite link \033[5:31m→\033[0m \033[93m#{bot.invite_url}\033[0m \033[5:31m←\033[0m"


# The infinite loop of the bot

while true
    # Read the configuration, it may change
    channels = read_parameters()
    # Wait and send the message
    waiting_send(bot, channels)
end
