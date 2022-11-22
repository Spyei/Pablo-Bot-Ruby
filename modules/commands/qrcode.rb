module Bot::DiscordCommands
    module Qr
      extend Discordrb::Commands::CommandContainer
      command(:qrcode, help_available: false, description: 'Seilá', usage: "p!qrcode <mensagem>") do |event, *txt|
        if event.message.content.length == 8 
          event.respond("**( ❌ ) Digite algo para ser um qr code**")
        else
          event.respond "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=#{txt.join(' ').gsub(" ","%20")}"
        end
      rescue StandardError => error
        event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
      end
    end
  end