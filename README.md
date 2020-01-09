# spammer
Discord spammer bot

## Presentation

This bot send the same message in a choosen channel at regular intervals

## Usage

This bot isn't made for be on multiple server. It made to be on only one server
by bot instance.

It can be use if you want to repeat a command of another bot at regular
interval.

If you want your own instance of this bot, clone if and complete files
`secrets.json.tpl` and `env.json.tpl` with the values you want.  
Then rename these files without the `.tpl` extention (`env.json.tpl` → `env.json`).

Install dependencies by doing `bundle install`.  
Then to start the bot execute the file `spammer.rb` by doing `ruby spammer.rb`
or `./spammed.rb`.

## Implementation

After the bot send a message, he read again the `env.json` file and wait the
the configured time to send the chooses message in the channel you want.  
That mean, you don't have to stop and start the bot to change the
configuration.
