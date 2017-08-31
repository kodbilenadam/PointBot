module Bot
  module DiscordCommands
    module Setup
      extend Discordrb::Commands::CommandContainer
      command :setup do |event, pref|
        break unless event.user.id == CONFIG.owner
        if pref == 'send' || pref == 'edit'
          m = event.send 'Please wait'
          CONFIG.server_id = event.server.id
          CONFIG.channel_id = m.channel.id
          CONFIG.message_id = m.id
          CONFIG.preference = pref
          File.write('data/config.yaml', CONFIG.to_yaml)
          m.edit '**Ready**'
        else
          event.send 'Correct usage *setup edit/send'
        end
      end
    end
  end
end
