module Bot::DiscordCommands
    module Pay
      extend Discordrb::Commands::CommandContainer
      command [:pay, :pagar] do |event, *txt|
        user = event.user
        user = event.message.mentions.first.on(event.server)
        quantia = txt.join(" ").gsub("<@#{user.id}>", "").gsub(" ", "")
        if user == "" 
          event.respond "**( ❌ )** Utilize da seguinte forma: \`p!pay <usuário> <quantia>\`."
        elsif quantia == ""
          event.respond "**( ❌ )** Digite uma quantia."
        elsif quantia != quantia.to_i.to_s
          event.respond "**( ❌ )** Digite uma quantia válida."
        elsif user == event.author.id
          event.respond "**( ❌ )** Você não pode se pagar."  
        elsif user.bot_account == true
          event.respond "**( ❌ )** Você não pode pagar bots."
        else
          event.respond "você pagou #{quantia} para <@#{user.id}>,"
        end
      rescue StandardError => penis_hetero
        event.respond "**( ❌ )** Utilize da seguinte forma: \`p!pay <usuário> <quantia>\`"
    end
  end
end