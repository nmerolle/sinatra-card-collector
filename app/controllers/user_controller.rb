
class UserController < ApplicationController

  get '/signup' do
    redirect_if_logged_in
    erb :'/users/new'
  end

  post '/signup' do
   
      @user = User.new(params[:user])
      if @user.save
        session[:user_id] = @user.id   
        redirect '/cards'
      else 
        redirect '/signup'
      end
    end

  get '/login' do
    redirect_if_logged_in
    erb :'users/login'
  end

  post '/login' do
  
    @user = User.find_by_username(params[:user][:username])
  
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect '/cards'
      else
        redirect '/login'
      end
  end

  get '/logout' do
      redirect_if_not_logged_in
      session.clear 
      redirect '/'
  end

end