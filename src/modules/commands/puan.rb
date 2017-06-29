module Bot
  module DiscordCommands
    # Puan ekleme bıdısı
    module MyCommand
      extend Discordrb::Commands::CommandContainer
      command :puan do |event|
        # Puan komutları buraya gelecek
      end
    end
  end
end
