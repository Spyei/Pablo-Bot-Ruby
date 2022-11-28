module Bot::DiscordCommands
    module Eval
        extend Discordrb::Commands::CommandContainer
        command [:atividade, :atv] do |event, *code|
            begin 
                user = event.user
                user = event.message.mentions.first.on(event.server) unless event.message.mentions.empty?
                s = user.activities.to_a.first
                detalhes = s.details
                if s == nil
                    event.respond "**( ❌ ) O usuário ou você está sem atividade no momento**"
                elsif detalhes == nil
                    detalhes = "sem detalhes"
                    event.respond "> **Nome:** \`#{s.name}\`\n> **Detalhes:** \`#{detalhes}\`\n> **Data de inicio:** <t:#{s.timestamps.start.to_i}:R>"
                else
                    event.respond "> **Nome:** \`#{s.name}\`\n> **Detalhes:** \`#{detalhes}\`\n> **Data de inicio:** <t:#{s.timestamps.start.to_i}:R>"
                end
            rescue => error
                event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
            end 
        end
    end
end