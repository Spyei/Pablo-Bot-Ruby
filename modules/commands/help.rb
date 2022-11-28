module Bot::DiscordCommands
    module Help
      extend Discordrb::Commands::CommandContainer
      command [:help, :ajuda] do |event|
        begin
          event.channel.send_embed do |embed|
          embed.title = "**( ✨ ) Help Menu**";
          embed.add_field(name: "**( 🎈 ) Variados**", value: "\`p!avatar <usuário>, p!ping, p!qrcode <texto>, p!botinfo, p!userinfo, p!atividade\`", inline: false);
          embed.color = "#ffffff";
          embed.footer = {
            text: "#{event.author.username + '#' + event.author.tag}",
            icon_url: "#{event.user.avatar_url}",
          }
        end
        rescue StandardError, IOError, EOFError => error
          event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
        end
      end
    end
end