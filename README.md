# Spammer
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

This program work with ruby 2.6.4.
Install dependencies by doing `bundle install`.  
Then to start the bot execute the file `spammer.rb` by doing `ruby spammer.rb`
or `./spammed.rb`.

Otherwise, you can do `./start.sh`.  
Than build and start the docker container of the bot.

## Implementation

After the bot send a message, he read again the `env.json` file and wait
the configured time to send the chooses message in the channel you want.  
That mean, you don't have to stop and start the bot to change the
configuration.

## Discord presentation

```markdown
# Spammer

This is the most useless and detestable bot which can exist.

## How it work

This bot send "Spam !" in channels named "spam" on your server each five secondes.

## Whant your personalized version ?

Be pleased to follow the readme file on the github repository (https://github.com/albandewilde/spammer).  
It's very easy to install you own bot.
```
