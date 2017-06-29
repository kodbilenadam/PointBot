module Bot
  module DiscordCommands
    # Puan ekleme bıdısı
    module Puan
      extend Discordrb::Commands::CommandContainer
      command :puan do |event, *args|
        pFile = File.read('data/points.json')
        points = JSON.parse(pFile)
        points[args[0]] += args[1].to_i
        File.write('data/points.json', points.to_json)

        pFile = File.read('data/points.json')
        points = JSON.parse(pFile)
        message = event.bot.servers[327885240775475201].channels[7].load_message(329808253678518284)
        message.edit("")
        return
      end
    end
  end
end
