module Bot::DiscordCommands
    module Avatar
      extend Discordrb::Commands::CommandContainer
      command [:avatar, :av] do |event, user|
        begin
          user = event.user
          user = event.message.mentions.first.on(event.server) unless event.message.mentions.empty?
          event.channel.send_embed do |embed|
          embed.title = "**( 🖼 ) Avatar de #{user.username + '#' + user.tag}**";
          embed.description = "Clique [aqui](#{user.avatar_url}) para baixar o avatar!";
          embed.image = Discordrb::Webhooks::EmbedImage.new(url: "#{user.avatar_url}?size=1024")
          embed.color = "#ffffff";
          embed.footer = {
            text: "#{user.username + '#' + user.tag}",
            icon_url: "#{user.avatar_url}",
          }
        end
        rescue StandardError, IOError, EOFError => error
          event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
      end
    end
  end
end