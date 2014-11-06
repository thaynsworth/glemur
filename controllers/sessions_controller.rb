class SessionsController < ApplicationController

  get '/new' do
    erb :'/sessions/new'
  end

  post '/new' do
    authenticate!
    user = User.find_by({username: params[:user][:username]})
    if user.password == params[:password]
      session[:current_user] = user.id
      redirect '/sessions/index'
    else
      redirect '/sessions/new'
    end
  end

  delete '/' do
    authenticate!
    session[:current_user] = nil
    redirect '/'
  end

  get '/index' do
    authenticate!
    erb :'/sessions/index'
  end

  get '/show' do
    authenticate!
    erb :'/sessions/show'
  end

end