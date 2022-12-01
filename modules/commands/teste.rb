module Bot::DiscordCommands
    module Teste
      extend Discordrb::Commands::CommandContainer
      command([:teste, :testinho], bucket: :teste, rate_limit_message: "**( ⌚ ) Aguarde \`#{}\` para poder trabalhar novamente**")do |event|
        event.respond "a"
      rescue StandardError => error
        event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
      end
    end
  end