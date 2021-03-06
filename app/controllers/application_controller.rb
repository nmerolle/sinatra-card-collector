require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      
      !!current_user
     
    end

    def current_user
      current_user ||= User.find_by(id: session[:user_id])
    end

    def redirect_if_logged_in
      redirect '/cards' if logged_in?
    end

    def redirect_if_not_logged_in
      redirect '/login' unless logged_in?
    end

  end
end
