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
        # Puan komutları buraya gelecek
      end
    end
  end
end
