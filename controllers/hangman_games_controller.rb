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
    authenticate!
    content_type :json

    sample_word = ["goat", "sheep", "cow", "lamb"].sample
    user_id = current_user.id
    game_state = sample_word.gsub(/\w/, '_')
    num_guess = 0

    game = HangmanGame.create({user_id: current_user.id, word: sample_word, game_state: game_state})

    {
      user_id: user_id,
      word: sample_word,
      game_state: game_state,
      num_wrong_guesses: num_guess,
      gameid: game.id
    }.to_json

  end

  patch '/:id/guess' do
    authenticate!
    content_type :json

    guessed_letter = params[:guess]
    game = HangmanGame.find(params[:id])
    word = game.word.split('')
    state = game.game_state.dup.split('')
    object_to_return = {}

    if word.include?(guessed_letter)
      game.guess_letter(guessed_letter)
      word.index(guessed_letter)
      object_to_return[:letter] = guessed_letter
    else
      game.num_wrong_guesses += guessed_letter
    end

    # modify the state if needed

    game.game_state = state
    game.save

    {
      user_id: game.user_id,
      game_state: state,
      num_wrong_guesses: (10 - game.num_wrong_guesses.length),
      gameid: game.id
    }.to_json


  end



end