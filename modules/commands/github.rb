module Bot::DiscordCommands
    module Github
      extend Discordrb::Commands::CommandContainer
      command [:github, :git] do |event, *texto|
        b = URI("https://api.github.com/users/#{texto.join(" ").gsub(" ", "+")}")
        a = Net::HTTP.get(b)
        c = JSON.parse(a.to_s)
        if texto.join(" ") == ""
            event.respond "**( ❌ ) Digite algum usuário do Github**"
        elsif c["message"] == "Not Found"
            event.respond "**( ❌ ) O usuário não foi encontrado**"
        else
        event.channel.send_embed do |embed|
            embed.title = "**( <:github:1050065986960752720> ) Github**";
            embed.add_field(name: "Informações do usuário: **#{c["login"]}**", value: "> **Nome:** \`#{c["login"]}\`\n> **ID:** \`#{c["id"]}\`\n> **Seguidor(es):** \`#{c["followers"]}\`\n> **Seguindo:** \`#{c["following"]}\`", inline: false);
            embed.add_field(name: "**Biografia**", value: "> #{c["bio"]}", inline: false)
            embed.color = "#000000";
            embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: "https://github.com/#{c["login"]}.png")
            embed.image = Discordrb::Webhooks::EmbedImage.new(url: "https://api.universal-network.xyz/screenshot?url=https://github.com/#{c["login"]}")
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