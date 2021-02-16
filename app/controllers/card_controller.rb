
class CardController < ApplicationController

    get '/cards' do
        @cards = Card.all
        erb :'/cards/index'
    end

    get '/cards/new' do
        erb :'/cards/new'
    end

    post '/cards' do
        card = Card.new(params[:card])
        if card.save
            redirect "/cards"
        else
            redirect '/cards/new'
        end
    end

 

    get "/cards/:id" do
        find_card
        erb :'cards/show'
    end

    get '/cards/:id/edit' do
        find_card
       
        erb :'/cards/edit'
    end

    patch "/cards/:id" do
        find_card
        if @card.update(params[:card])
            redirect "/cards/#{@card.id}"
        else
            redirect "/cards/#{@card.id}/edit"
        end
    end

    delete "/cards/:id" do
        find_card
        @card.destroy if @card
        redirect '/cards'
    end

private
    def find_card
        @card = Card.find_by_id(params[:id])
    end

end