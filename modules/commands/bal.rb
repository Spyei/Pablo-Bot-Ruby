module Bot::DiscordCommands
  module Bal
      extend Discordrb::Commands::CommandContainer
      command [:bal, :balance, :atm, :saldo] do |event, *code|
            begin
            user = event.user 
            user = event.message.mentions.first.on(event.server) unless event.message.mentions.empty?
            dabase = $db[:dinheiro].where(user: "#{user.id}").first
            dabase_author = $db[:dinheiro].where(user: "#{event.author.id}").first
              if dabase == nil
                event.respond("**( ❌ )** Você precisa se registrar na minha database, use \`p!registrar\`.")
              elsif dabase == nil
                event.channel.send_embed do |embed|
                  embed.title = "**( 🏦 ) Saldo Báncario**";
                  embed.description = "<@#{user.id}>, tem  no total \`0\` 💸";
                  embed.color = "#2ECC71"
                  embed.footer = {
                    text: "#{user.username + '#' + user.tag}",
                    icon_url: "#{user.avatar_url}",
                  }
              end      
              else
              event.channel.send_embed do |embed|
                embed.title = "**( 🏦 )** Saldo Báncario";
                embed.description = "<@#{user.id}>, tem  no total \`#{dabase[:quantia]}\` 💸";
                embed.color = "2ECC71"
                embed.footer = {
                  text: "#{user.username + '#' + user.tag}",
                  icon_url: "#{user.avatar_url}",
                }
              end
          end
          rescue StandardError => error
            event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
       end 
     end
  end
end 