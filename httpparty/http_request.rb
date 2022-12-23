require 'byebug'
require 'httparty'

MORTY_API_URL = 'https://rickandmortyapi.com/api'

morty_response = HTTParty.get(MORTY_API_URL)

if morty_response.code == 200
  episodes_response = HTTParty.get(morty_response.parsed_response['episodes'])

  episodes_response.parsed_response['results'].map! do |episode|
    episode['characters'].map! do |character_url|
      character_response = HTTParty.get(character_url)
      if character_response.code == 200
        character_url = character_response.parsed_response
      end
      character_url
    end
    episode
  end


end
