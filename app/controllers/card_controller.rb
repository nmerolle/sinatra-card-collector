
class CardController < ApplicationController

    get '/cards' do
        redirect_if_not_logged_in
        @user = current_user
        @cards = Card.all
        erb :'/cards/index'   
    end

    get '/cards/new' do
        redirect_if_not_logged_in
        erb :'/cards/new'
    end

    post '/cards' do
        redirect_if_not_logged_in
       
        if params[:playername] == "" || params[:team] == "" || params[:card_company] == "" || params[:year] == ""
            redirect 'cards/new'
        else
            @card = current_user.cards.build(params[:card])
            
            @card.save
        
            if @card.save
                redirect "cards/#{@card.id}"
            else
                redirect 'cards/new'
            end
        end           
    end

    get "/cards/:id" do
        redirect_if_not_logged_in
        find_card
        erb :'cards/show'
    end

    get '/cards/:id/edit' do
        redirect_if_not_logged_in
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
        redirect_if_not_logged_in
        find_card
        
        if @card.user_id == current_user.id
            @card.destroy if @card
            redirect '/cards'
        else
            redirect '/cards'
        end
    end

private
    def find_card
        @card = Card.find_by_id(params[:id])
    end

end