module Bot
  module DiscordCommands
    # Puan ekleme bıdısı
    module PuanAll
      extend Discordrb::Commands::CommandContainer
      command :puanall do |event, *args|
        break unless event.user.id == CONFIG.owner
        pFile = File.read('data/points.json')
        points = JSON.parse(pFile)
        points.each do |key, value|
          points[key] = value + args[0].to_i
        end
        File.write('data/points.json', points.to_json)

        pFile = File.read('data/points.json')
        points = JSON.parse(pFile)
        message = event.bot.servers[327885240775475201].channels[7].load_message(329808253678518284)
        text = "**Puanlar**\n"
        values = Array.new
        ids = [152562555376762881, 121825838856404995, 115464605676863492, 209085426768674816, 158288711799275521, 269403726735867904, 224196563939885066, 128096538231701504, 119825074038636548, 132788609320353792, 119822700809158656, 118825283963846656];
        points.each do |key, value|
          values.push(value);
        end
        names = Array.new
        ids.each do |id|
          names.push(event.bot.users[id].name)
        end
        counter = 0
        while counter < names.length
          text += "#{names[counter]}: **#{values[counter]}**\n"
          counter += 1
        end
        message.edit(text)
        puts "Puanlar güncellendi!"
        return
      end
    end
  end
end
