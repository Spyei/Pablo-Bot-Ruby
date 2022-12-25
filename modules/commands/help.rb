module Bot::DiscordCommands
    module Help
      extend Discordrb::Commands::CommandContainer
      command [:help, :ajuda] do |event|
        begin
          event.channel.send_embed do |embed|
          embed.title = "**( ✨ )** Help Menu";
          embed.add_field(name: "**( 🎈 )** Variados", value: "\`p!avatar (usuário), p!ping, p!qrcode <texto>\`", inline: false);
          embed.add_field(name: "**( 💸 )** Economia", value: "\`p!bal, p!registrar, p!work\`", inline: false);
          embed.add_field(name: "**( ℹ )** Informações", value: "\`p!github <usuário>, p!botinfo, p!userinfo (usuário), p!atividade (usuário), p!npm <npm>\`", inline: false);
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