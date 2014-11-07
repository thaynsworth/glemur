class HangmanGamesController < ApplicationController

  get '/' do
    authenticate!
    erb :'hangman_games/index'
  end

  get '/new' do
    authenticate!
    erb :'hangman_games/new'
  end

end