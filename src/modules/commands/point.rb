module Bot
  module DiscordCommands
    # Puan ekleme bıdısı
    module Point
      extend Discordrb::Commands::CommandContainer
      command :point do |event, *args|
        break unless event.user.id == CONFIG.owner
        if CONFIG.preference.nil?
          event.send 'Please configure bot using *setup send/edit'
        elsif CONFIG.preference == 'edit'
          pFile = File.read('data/points.json')
          points = JSON.parse(pFile)
          points.default = 0
          if args[1] == 'remove'
            points.delete(args[0])
          else
            points[args[0]] += args[1].to_i
          end
          File.write('data/points.json', points.to_json)
          ci = event.bot.servers[CONFIG.server_id].channels.index { |x| x.id == CONFIG.channel_id }
          message = event.bot.servers[CONFIG.server_id].channels[ci].load_message(CONFIG.message_id)
          text = "**Points**\n"
          sirali = points.sort_by { |_isim, puan| puan }
          ters = sirali.reverse!
          @a = 0
          ters.each do |ii, b|
            @a += 1
            nick = event.bot.users[ii.to_i]
            if nick.nil?
              nick = ii
            else
              nick = event.bot.users[ii.to_i].name
           end
            text += "#{@a}. #{nick}: **#{b}**\n"
          end
          message.edit text

        elsif CONFIG.preference == 'send'
          pFile = File.read('data/points.json')
          points = JSON.parse(pFile)
          points.default = 0
          if args[1] == 'remove'
            points.delete(args[0])
          else
            points[args[0]] += args[1].to_i
          end
          File.write('data/points.json', points.to_json)
          text = "**Points**\n"
          sirali = points.sort_by { |_isim, puan| puan }
          ters = sirali.reverse!
          @a = 0
          ters.each do |ii, b|
            @a += 1
            nick = event.bot.users[ii.to_i]
            if nick.nil?
              nick = ii
            else
              nick = event.bot.users[ii.to_i].name
           end
            text += "#{@a}. #{nick}: **#{b}**\n"
          end
          event.send text
        end
      end
    end
  end
end
