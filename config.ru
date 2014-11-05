require 'bundler'
Bundler.require(:default)

Dir.glob("./{helpers,controllers,models}/*.rb").each do |file|
  require file
  puts "required #{file}"
end


map('/sessions'){ run SessionsController }
map('/users'){ run UsersController }
map('/'){ run ApplicationController }

