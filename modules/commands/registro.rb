module Bot::DiscordCommands
    module Registro
      extend Discordrb::Commands::CommandContainer
      command [:registrar, :registro, :register] do |event|
        begin
            if $db[:dinheiro].where(user: "#{event.author.id}").first == nil
                event.channel.send_embed do |embed|
                    embed.title = "**( ✨ ) Registro**";
                    embed.description = "<@#{event.author.id}>, Você foi registrado com sucesso na minha database, agora pode usar os comandos de economia!";
                    embed.color = "#2ECC71";
                    embed.footer = {
                    text: "#{event.author.username + '#' + event.author.tag}",
                    icon_url: "#{event.user.avatar_url}",
                    }
                end
                $db[:dinheiro].insert(user: "#{event.author.id}", quantia: 0)
            else
                event.respond("**( ❌ ) Você já está registrado na minha database**")
            end
        rescue StandardError => error
          event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
        end
      end
    end
  end