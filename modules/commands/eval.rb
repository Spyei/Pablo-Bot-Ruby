module Bot::DiscordCommands
    module Eval
        extend Discordrb::Commands::CommandContainer
        command :eval do |event, *code|
            begin 
                usuarios = ["955095844275781693", "963124227911860264", "834123622334988288", "915677756958863372"].include? "#{event.author.id}"
                if event.message.content.length == 6
                    event.respond("**( ❌ ) Digite algo para que eu possa executar**")
                elsif usuarios == false
                    event.respond("**( ❌ ) Você não tem permição para executar este comando**")
                else
                    event.respond("\`\`\`ruby\n#{eval event.message.content.gsub 'p!eval ', ''}\n\`\`\`")
                end
            rescue => error
                event.respond("\`\`\`ruby\n#{error}\n\`\`\`")
            end 
        end
    end
end
