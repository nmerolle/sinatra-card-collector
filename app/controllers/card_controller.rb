
class CardController < ApplicationController

    get '/cards/new' do
        erb :'/cards/new'
    end
end