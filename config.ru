require 'bundler'
Bundler.require(:default)

Dir.glob("./{helpers,controllers,models}/*.rb").each do |file|
  require file
  puts "required #{file}"
end

map('/'){ run ApplicationController }