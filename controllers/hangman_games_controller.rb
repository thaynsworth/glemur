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
    game_state = sample_word.gsub(/\w/, '_')
    num_guess = 0

    game = HangmanGame.create({word: sample_word, game_state: game_state})

    {
      user_id: user_id,
      word: sample_word,
      game_state: game_state,
      num_wrong_guesses: num_guess,
      gameid: game.id
    }.to_json

  end

  patch '/:id/guess' do

    game = HangmanGame.find(params[id])

    state = game.game_state.dup

    # modify the state if needed

    game.game_state = state
    game.save




  end



end