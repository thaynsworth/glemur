class HangmanGamesController < ApplicationController

  get '/' do
    authenticate!
    erb :'hangman_games/index'
  end

  get '/new' do
    authenticate!

    @letters = ("a".."z").to_a

    erb :'hangman_games/new'
  end

  post '/new' do
    content_type :json

    sample_word = ["goat", "sheep", "cow", "lamb"].sample
    user_id = current_user.id
    game_state = []
    num_guess = 0

    new_game = {
      user_id: user_id,
      word: sample_word,
      game_state: game_state,
      num_wrong_guesses: num_guess
    }.to_json

  end

end