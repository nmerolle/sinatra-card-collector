
class UserController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/users/signup' do
      user = User.new(params[:user])
      if user.save
        session[:user_id] = user.id
        redirect :'games'
      else
        redirect :'/users/signup'
    end
  
  
  get '/login' do
    erb :'/users/login'
  end


end