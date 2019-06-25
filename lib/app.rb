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

  post '/' do
    session[:word_length] = params["word_length"].to_i
    redirect '/game'
  end

  get '/game' do
    session[:status] ||= Hangman.set_game(session[:word_length])
    @status = session[:status]
    erb :game, layout: :main
  end

  post '/game' do
    @status = session[:status]
    guess = params["guess"]
    session[:status] = Hangman.play(@status, guess)
    redirect Hangman.game_over?(@status)
  end

  get "/win" do
    @status = session.delete(:status)
    erb :win, layout: :main
  end

  get "/lose" do
    @status = session.delete(:status)
    erb :lose, layout: :main
  end
end