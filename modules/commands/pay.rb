module Bot::DiscordCommands
    module Pay
      extend Discordrb::Commands::CommandContainer
      command [:pay, :pagar] do |event, *txt|
        user = event.user
        user = event.message.mentions.first.on(event.server) unless event.message.mentions.empty?
        event.respond "você pagou #{txt.join(" ").gsub("<@#{user.id}>", "").gsub(" ", "")} para <@#{user.id}>,"
      rescue StandardError => error
        event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
    end
  end
end