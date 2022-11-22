# Exportações #
require "discordrb"
require "json"
require "http"
require "cleverbot"
require "rest-client"
require "vigenere"
require "yaml"

# Módulo $bot para global 
module Bot
  CONFIG = YAML.load_file("./configbot.yaml")

  $bot = Discordrb::Commands::CommandBot.new token: ENV["token"], client_id: CONFIG["$client_id"], prefix: CONFIG["$prefix"], ignore_bots: false, help_command: false

  def self.load_modules(klass, path)
    new_module = Module.new
    const_set(klass.to_sym, new_module)
    Dir["modules/#{path}/*.rb"].each { |file| load file }
    new_module.constants.each do |mod|
      $bot.include! new_module.const_get(mod)
    end
  end
  load_modules(:DiscordEvents, "events")
  load_modules(:DiscordCommands, "commands")

  $bot.mention do |event|
    event.respond("Olá **#{event.author.username}##{event.author.discriminator}**, Sou o **Pablo bot#2109** fui feito para testar a lib \`Discord.rb (Ruby)\`\n> **Meu prefixo:** \`p!\`")
  end

  $bot.run :async # Ligar bot
end
# Módulo $bot para global 

$bot.sync # Ligar bot 2.0