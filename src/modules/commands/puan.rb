module Bot
  module DiscordCommands
    # Puan ekleme bıdısı
    module Puan
      extend Discordrb::Commands::CommandContainer
      command :puan do |event, *args|
        File.open('/data/points.json', 'w+') do |pFile|
          points = JSON.parse(pFile)
          points[args[0]] += args[1].to_i
          pFile.write(points.to_json)
        end
        # Puan komutları buraya gelecek
      end
    end
  end
end
