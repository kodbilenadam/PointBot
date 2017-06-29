module Bot
  module DiscordCommands
    # Puan ekleme bıdısı
    module Puan
      extend Discordrb::Commands::CommandContainer
      command :puan do |event, *args|
        points = JSON.parse('.data/points.json')
        points[args[0]] += args[1].to_i
        points.to_json 
        # Puan komutları buraya gelecek
      end
    end
  end
end
