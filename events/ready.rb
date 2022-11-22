module Bot::DiscordEvents
    module Ready
      extend Discordrb::EventContainer
      ready do |_event|
      $bot.listening = "nao sei"
      $uptimer = Time.now
    end
  end
end