module Bot::DiscordCommands
    module Translate
      extend Discordrb::Commands::CommandContainer
      command [:translate, :traduzir, :tr] do |event, *texto|
        res = "#{texto.join(" ")}".split("/")
        lang = res[0]
        texto = res[1]
    pinto = URI("https://api.popcat.xyz/translate?to=#{lang}&text=#{texto.gsub(" ", "+")}")
    penis = Net::HTTP.get(pinto)
    porra = JSON.parse(penis.to_s)
        if lang and texto == ""
            event.respond "**( ❌ )** Use da seguinte forma: \`p!traduzir {linguagem}/{texto}\`."
        elsif porra["translated"] == "The language \'#{lang.gsub("+", " ")}\' is not supported." 
          event.respond "**( ❌ )** O idioma não foi encontrado."
        else
            event.respond "#{porra["translated"]}"
        end
    end
      rescue StandardError => error
        event.respond("**( ❌ ) Erro econtrado: \`\`\`ruby\n#{error}\n\`\`\`**")
    end
  end