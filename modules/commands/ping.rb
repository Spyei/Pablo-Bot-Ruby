module Bot::DiscordCommands
  module Ping
    extend Discordrb::Commands::CommandContainer
    command([:ping, :ms], help_available: false, description: 'Retorna o ping atual em ms', usage: "p!ping") do |event, *txt|
      begin
        event.channel.send_embed do |embed|
          embed.title = "**( 🏓 ) Ping**";
          embed.description = "Meu ping está em: \`#{Integer(Time.now - event.timestamp)}ms\`";
          embed.color = "#ffffff";
          embed.footer = {
            text: "#{event.author.username + '#' + event.author.tag}",
            icon_url: "#{event.user.avatar_url}",
          }
          end
      rescue StandardError => error
        event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
      end
    end
  end
end