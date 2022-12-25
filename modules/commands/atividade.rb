module Bot::DiscordCommands
    module Atividade
        extend Discordrb::Commands::CommandContainer
        command [:atividade, :atv] do |event, *code|
            begin 
                user = event.user
                user = event.message.mentions.first.on(event.server) unless event.message.mentions.empty?
                s = user.activities.to_a.first
                detalhes = s.details
                if s == nil
                    event.respond "**( ❌ )** O usuário ou você está sem atividade no momento."
                elsif detalhes == nil
                    detalhes = "sem detalhes"
                    event.respond "> **Nome:** \`#{s.name}\`\n> **Detalhes:** \`#{detalhes}\`\n> **Data de inicio:** <t:#{s.timestamps.start.to_i}:R>"
                else
                    event.respond "> **Nome:** \`#{s.name}\`\n> **Detalhes:** \`#{detalhes}\`\n> **Data de inicio:** <t:#{s.timestamps.start.to_i}:R>"
                end
            rescue StandardError => error
                event.respond("**( ❌ )** A atividade é inválida.")
            end 
        end
    end
end