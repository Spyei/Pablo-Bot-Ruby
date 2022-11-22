module Bot::DiscordCommands
    module Eval
        extend Discordrb::Commands::CommandContainer
        command :eval do |event, *code|
            break unless event.user.id == 955095844275781693 or event.user.id == 963124227911860264 or event.user.id == 834123622334988288 or event.user.id == 915677756958863372 or event.user.id == 481534167893540874
            begin    
                event.respond("\`\`\`ruby\n#{eval event.message.content.gsub 'p!eval ', ''}\n\`\`\`")
        rescue => error
            event.respond("\`\`\`ruby\n#{error}\n\`\`\`")
            end 
        end
    end
end
