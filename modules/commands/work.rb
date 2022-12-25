module Bot::DiscordCommands
    module Work
        extend Discordrb::Commands::CommandContainer
        command [:work, :trabalhar], bucket: :work, rate_limit_message: "**( ⌚ ) Aguarde \`2 minutos\` para poder trabalhar novamente**" do |event|
              begin
              user = event.user 
              user = event.message.mentions.first.on(event.server) unless event.message.mentions.empty?
              dabase = $db[:dinheiro].where(user: "#{user.id}").first
              trabalhos = ["Cozinheiro", "Faxineiro", "Ladrão", "Pogramador", "Administrador", "Gari", "Empresário", "Técnico", "Pedreiro", "Professor", "Vendedor", "Atendente", "Gamer", "Youtuber", "Cabeleleiro", "Boxeador"]
                randomnatorio = rand(100..300)
                if dabase == nil
                  event.respond("**( ❌ ) Você precisa se registrar na minha database, use \`p!registrar\`**")
                else
                  event.channel.send_embed do |embed|
                    embed.title = "**( 💼 )** Trabalhar";
                    embed.description = "Você trabalhou como **#{trabalhos[rand(0..trabalhos.length)]}** e ganhou \`#{randomnatorio}\` 💸";
                    embed.color = "#2ECC71"
                    embed.footer = {
                      text: "#{user.username + '#' + user.tag}",
                      icon_url: "#{user.avatar_url}",
                    }
                    $db[:dinheiro].update(user: "#{event.author.id}", quantia: $db[:dinheiro].where(user: "#{event.author.id}").first[:quantia] + randomnatorio)
                end      
            end
            rescue StandardError => error
              event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
         end 
       end
    end
  end 