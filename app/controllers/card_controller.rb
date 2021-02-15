
class CardController < ApplicationController

    get '/cards' do
        @cards = Card.all
        erb :'/cards/index'
    end

    get '/cards/new' do
        erb :'/cards/new'
    end

    post '/cards' do
        card = Card.create(params[:card])
        if card.save
            redirect "/cards"
        else
            redirect '/cards/new'
        end
    end






    get '/cards/:id' do
        @card = Card.find_by_id(params[:id])
        erb :'cards/show'
      end
end