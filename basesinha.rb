module Bot::DiscordCommands
    module Basesinha
      extend Discordrb::Commands::CommandContainer
      command [:basesinha, :base] do |event|
        # Código aqui
      rescue StandardError => error
        event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
    end
  end
end