module Bot::DiscordCommands
    module Userinfo
      extend Discordrb::Commands::CommandContainer
      command [:userinfo, :ui] do |event, user|
        begin
          user = event.user
          user = event.message.mentions.first.on(event.server) unless event.message.mentions.empty?
          boost = user.boosting?.to_s

          event.channel.send_embed do |embed|
          embed.thumbnail = { url: user.avatar_url };
          embed.title = "( 🔎 ) Informações de #{user.username + '#' + user.tag}";
          embed.description = "> **Boost status:** \`#{boost.gsub("false", "Não está impulsionando o servidor").gsub("true", "\:boost: Está impulsionando o servidor")}\`\n> **Conta criada em:** <t:#{Integer(user.creation_time.to_i)}:f>\n> **Entrou no servidor em:** <t:#{Integer(user.joined_at.to_i)}:f>\n> **Status:** #{user.status.to_s.gsub("dnd", "<:donot:998556708324524162>").gsub("online", "<:online:998330562764886056>").gsub("idle", "<:idle:998578491098419271>")}\n> **Plataforma:** \`#{user.client_status.to_a.join(", ").split(",")[0].gsub("desktop", "Desktop").gsub("mobile", "Mobile").gsub("web", "Web")}\`\n> **Discriminator:** \`##{event.author.tag}\`\n> **Cargo mais alto:** <@&#{user.highest_role.id}>\n> **ID:** \`#{user.id}\`\n> **Atividade:** \`use p!atividade @#{user.username + '#' + user.tag}\`"
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