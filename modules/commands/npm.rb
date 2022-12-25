module Bot::DiscordCommands
    module Npm
      extend Discordrb::Commands::CommandContainer
      command [:npm, :npmsearch] do |event, *texto|
        pinto = URI("https://api.universal-network.xyz/npm?pkg=#{texto.join(" ").gsub(" ", "+")}")
        penis = Net::HTTP.get(pinto)
        porra = JSON.parse(penis.to_s)
        if texto.join(" ") == ""
            event.respond "**( ❌ )** Digite alguma npm a ser pesquisada."
        elsif porra == []
          event.respond "**( ❌ )** A npm não foi encontrada ou não existe."
        else
        event.channel.send_embed do |embed|
            embed.title = "**( <:npmicon:1050107692611555338> )** Npm**";
            embed.add_field(name: "Informações da npm **#{porra.first["package"]["name"]}**", value: "> **Versão:** \`#{porra.first["package"]["version"]}\`\n> **Criador:** \`#{porra.first["package"]["publisher"]["username"]}\`", inline: false)
            embed.add_field(name: "**Descrição:**", value: "#{porra.first["package"]["description"]}", inline: false)
            embed.color = "#FF0000";
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