class HangmanGamesController < ApplicationController

  get '/' do
    authenticate!
    erb :'hangman_games/index'
  end

  get '/new' do
    authenticate!

    @letters = ("A".."Z").to_a

    erb :'hangman_games/new'
  end

  post '/new' do
    authenticate!
    content_type :json

    sample_word = ["goat", "sheep", "cow", "lamb", "dog", "ebola", "cheetos", "pasta"].sample
    user_id = current_user.id
    game_state = sample_word.gsub(/\w/, '_')

    game = HangmanGame.create({user_id: current_user.id, word: sample_word, game_state: game_state, guessed_letters: ""})

    game.to_json

  end

  patch '/:id/guess' do
    authenticate!
    content_type :json

    game = HangmanGame.find(params[:id])
    guessed_letter = params[:guess].downcase
    game.guess_letter(guessed_letter)
    game.game_result(game.word, game.game_state)
    num_guesses = game.guessed_letters.length

    {
      user_id: game.user_id,
      word: game.word,
      game_state: game.game_state,
      guessed_letters: game.guessed_letters,
      gameid: game.id,
      num_guesses: num_guesses
    }.to_json
  end

end