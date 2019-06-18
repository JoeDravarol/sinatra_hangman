require 'hangman'

class HangmanApp < Sinatra::Base
  set :root, 'lib/app'

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index, layout: :main
  end

  post '/game' do
    word_length = params["word_length"].to_i
    "Game #{word_length}"
  end
end