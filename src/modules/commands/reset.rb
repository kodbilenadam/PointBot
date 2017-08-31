module Bot
  module DiscordCommands
    module Reset
      extend Discordrb::Commands::CommandContainer
      command :reset do |event|
        break unless event.user.id == CONFIG.owner
        m = event.send 'Resetting..'
        CONFIG.server_id = nil
        CONFIG.channel_id = nil
        CONFIG.message_id = nil
        CONFIG.preference = nil
        File.write('data/config.yaml', CONFIG.to_yaml)
        File.write('data/points.json', {}.to_json)
        m.edit "Done."
      end
    end
  end
end
