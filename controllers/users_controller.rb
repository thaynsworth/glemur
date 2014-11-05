class UsersController < ApplicationController

  get '/new' do
    erb :'/users/new'
  end

  post '/new' do
    user = User.new(params[:user])
    user.password = params[:password]
    user.save!
    redirect '/sessions/new'
  end

end