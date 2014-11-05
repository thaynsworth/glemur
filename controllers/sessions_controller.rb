class SessionsController < ApplicationController

  get '/new' do
    erb :'/sessions/new'
  end

  post '/new' do
    user = User.find_by({username: params[:username]})
    if user.password = params[:password]
      session[:current_user] = user.id
      redirect '/sessions/index'
    else
      redirect '/sessions/new'
    end
  end

end