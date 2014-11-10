class TictacGamesController < ApplicationController

  get '/' do
    authenticate!
    erb :'tictac_games/index'
  end

end