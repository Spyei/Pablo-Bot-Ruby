module Bot::DiscordCommands
    module Eval
        extend Discordrb::Commands::CommandContainer
        command :atividade do |event, *code|
            begin 
                user = event.user
                user = event.message.mentions.first.on(event.server) unless event.message.mentions.empty?
                s = user.activities.to_a.first
               event.respond "> **Nome:** \`#{s.name}\`\n> **Detalhes:** \`#{s.details}\`\n> **Data de inicio:** <t:#{s.timestamps.start.to_i}:R>\`"
            rescue => error
                event.respond("\`\`\`ruby\n#{error}\n\`\`\`")
            end 
        end
    end
end
