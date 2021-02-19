
class CardController < ApplicationController

    get '/cards' do
        redirect_if_not_logged_in
        @user = current_user
        @cards = current_user.cards
        erb :'/cards/index'   
    end

    get '/cards/new' do
        redirect_if_not_logged_in
        erb :'/cards/new'
    end

    post '/cards' do
        redirect_if_not_logged_in
        @card = current_user.cards.build(params[:card])
        if @card.save
            redirect "cards/#{@card.id}"
        else
            flash[:error] = @card.errors.full_messages
            redirect 'cards/new'
        end           
    end

    get "/cards/:id" do
        redirect_if_not_logged_in
        find_card
        redirect_if_not_owner
        erb :'cards/show'
    end

    get '/cards/:id/edit' do
        redirect_if_not_logged_in
        find_card
        redirect_if_not_owner
        erb :'/cards/edit'
    end

    patch "/cards/:id" do
       
        find_card
        redirect_if_not_owner
        if @card.update(params[:card])
            redirect "/cards/#{@card.id}"
        else
            redirect "/cards/#{@card.id}/edit"
        end
    end

    delete "/cards/:id" do
        redirect_if_not_logged_in
        find_card
        redirect_if_not_owner
        
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

    def redirect_if_not_owner
        redirect '/cards' unless @card.user == current_user
    end

end