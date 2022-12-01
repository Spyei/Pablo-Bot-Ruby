# Exportações #
require "discordrb"
require "json"
require "http"
require "cleverbot"
require "rest-client"
require "vigenere"
require "yaml"
require "sequel"

# Módulo $bot para global 
module Bot
  $db = Sequel.sqlite("./database.db")
  CONFIG = YAML.load_file("./configbot.yaml")
  TOKEN = YAML.load_file("./token.yaml")
  $bot = Discordrb::Commands::CommandBot.new token: TOKEN["$token"], client_id: CONFIG["$client_id"], prefix: CONFIG["$prefix"], ignore_bots: false, help_command: false

  def self.load_modules(cass, path)
    new_module = Module.new
    const_set(cass.to_sym, new_module)
    Dir["modules/#{path}/*.rb"].each { |file| load file }
    new_module.constants.each do |mod|
      $bot.include! new_module.const_get(mod)
    end
  end
  
  load_modules(:DiscordEvents, "events")
  load_modules(:DiscordCommands, "commands")

  $bot.mention do |event|
    event.respond("Olá **#{event.author.username}##{event.author.discriminator}**, Sou o **Pablo bot**!\n> **Meu prefixo:** \`p!\`")
  end

  # Cooldowns
  $bot.bucket :teste, delay: 60
  $bot.bucket :work, delay: 120

=begin
  $bot.message do |event|
    sim = "#{event.message.content}".include? "https://"  
    if sim == true
      event.message.delete
    end
  end

  $bot.message_update do |event|
    sim = "#{event.message.content}".include? "https://"  
    if sim == true
      event.message.delete
    end
  end
=end

  $bot.run :async # Ligar bot
end

$bot.sync # Ligar bot 2.0