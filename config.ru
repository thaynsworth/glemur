require 'bundler'
Bundler.require(:default)

Dir.glob("./{helpers,controllers,models}/*.rb").each do |file|
  require file
  puts "required #{file}"
end


map('/hangman_games'){ run HangmanGamesController }
map('/users'){ run UsersController }
map('/sessions'){ run SessionsController }
map('/'){ run ApplicationController }

