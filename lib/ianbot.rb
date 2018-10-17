require 'slack-ruby-bot'
require 'httparty'

class Bot < SlackRubyBot::Bot





  # command 'hangman' do |client, data, _match|


  #   user_id = data['user']

  #   user_msg = data['text']
  #   user_guess = user_msg.split(' ')[1..-1].join(' ')

  #   bot_msg = "You have x attempts remaining."


  #     client.web_client.chat_postMessage(channel: data.channel, text: "FULL MESSAGE: \n #{data}")

  #     client.web_client.chat_postMessage(channel: data.channel, text: "FULL MESSAGE: \n #{_match}")

  #     client.web_client.chat_postMessage(channel: data.channel, text: "_ _ _ _ _")

  #     client.web_client.chat_postMessage(channel: data.channel, text: "Your guess: #{user_guess}")

  #     client.web_client.chat_postMessage(channel: data.channel, text: "#{bot_msg}")

  #     client.web_client.chat_postMessage(channel: data.channel, text: "Guesses so far: #{guess_history.join(",")}")      

  # end

  guessed_letters = Hash.new { |this_hash,key| this_hash[key] = [] }


  regex_letter = /\w/

  command regex_letter do |client, data, _match|


    user_id = data['user']

    guess = data['text']

    guessed_letters[user_id] << guess

    bot_msg = "You have x attempts remaining."


      client.web_client.chat_postMessage(channel: data.channel, text: "FULL MESSAGE: \n #{data}")

      client.web_client.chat_postMessage(channel: data.channel, text: "FULL MESSAGE: \n #{_match}")

      client.web_client.chat_postMessage(channel: data.channel, text: "_ _ _ _ _")

      client.web_client.chat_postMessage(channel: data.channel, text: "Your guess: #{guess}")

      client.web_client.chat_postMessage(channel: data.channel, text: "#{bot_msg}")
    
    client.web_client.chat_postMessage(channel: data.channel, text: "Guesses so far: #{guessed_letters[user_id].join(", ")}")  

  end

  regex_word = /\w+/


    command regex_word do |client, data, _match|


    user_id = data['user']

    guess = data['text']

    guessed_letters[user_id] << guess

    bot_msg = "You have x attempts remaining."


      client.web_client.chat_postMessage(channel: data.channel, text: "FULL MESSAGE: \n #{data}")

      client.web_client.chat_postMessage(channel: data.channel, text: "FULL MESSAGE: \n #{_match}")

      client.web_client.chat_postMessage(channel: data.channel, text: "_ _ _ _ _")

      client.web_client.chat_postMessage(channel: data.channel, text: "Your guess: #{guess}")

      client.web_client.chat_postMessage(channel: data.channel, text: "#{bot_msg}")
    
    client.web_client.chat_postMessage(channel: data.channel, text: "Guesses so far: #{guessed_letters[user_id].join(", ")}")  

  end





end







SlackRubyBot::Client.logger.level = Logger::WARN

Bot.run