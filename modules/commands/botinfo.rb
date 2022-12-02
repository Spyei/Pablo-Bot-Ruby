module Bot::DiscordCommands
    module Botifo
      extend Discordrb::Commands::CommandContainer
      command([:botinfo, :bi], help_available: false, description: 'Mostra informações do bot', usage: "p!botinfo") do |event|
        begin
          event.channel.send_embed do |embed|
          embed.title = "**( 🤖 ) Bot Info**";
          embed.add_field(name: "**( 👨‍💻 ) Desenvolvedor**", value: "> \`Spyei#7312\`", inline: false);
          embed.add_field(name: "**( ℹ ) Informações**", value: "> Conto com \`#{event.bot.commands.size}\` comandos\n> Estou em \`#{ event.bot.servers.count}\` servidores\n> Fui programado em \`Ruby\`, utilizando a livraria \`discord.rb\`\n> Source code: [Github](https://github.com/Spyei/PabloBot-Discord.rb)", inline: false);
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