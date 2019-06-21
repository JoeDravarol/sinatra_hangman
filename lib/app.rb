require 'hangman'

class HangmanApp < Sinatra::Base
  set :root, 'lib/app'
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index, layout: :main
  end

  post '/game' do
    @word_length = params["word_length"].to_i
    redirect '/game'
  end

  get '/game' do
    @word_length = params["word_length"].to_i
    erb :game, layout: :main
  end
end