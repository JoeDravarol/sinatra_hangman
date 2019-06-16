require 'hangman'

class HangmanApp < Sinatra::Base
  set :root, 'lib/app'

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World!'
  end
end