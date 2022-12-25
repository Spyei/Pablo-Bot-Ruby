module Bot::DiscordCommands
    module Clima
      extend Discordrb::Commands::CommandContainer
      command [:weather, :tempo, :clima] do |event, *texto|
        pinto = URI("https://api.popcat.xyz/weather?q=#{texto.join(" ").gsub(" ", "+")}")
        penis = Net::HTTP.get(pinto)
        porra = JSON.parse(penis.to_s)
        if texto.join(" ") == ""
            event.respond "**( ❌ )** Digite algum local para ver o clima."
        elsif porra == []
          event.respond "**( ❌ )** O local não foi encontrado."
        else
        event.channel.send_embed do |embed|
        embed.title = "**( 🌡 ) Clima**"
        embed.add_field(name: "Informações sobre a temperatura do local **#{porra.first["location"]["name"]}**", value: "> **Temperatura:** \`#{porra.first["current"]["temperature"]}°c\`\n> **Humildade:** \`#{porra.first["current"]["humidity"]}%\`\n> **Vento:** \`#{porra.first["current"]["windspeed"]}\`\n> **Timezone:** \`#{porra.first["location"]["timezone"]}\`", inline: false)
        embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: "#{porra.first["current"]["imageUrl"]}")
        embed.color = "#0096FF";
        embed.footer = {
          text: "#{event.author.username + '#' + event.author.tag}",
          icon_url: "#{event.user.avatar_url}",
        }
        end
    end
      rescue StandardError => error
        event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
    end
  end
end