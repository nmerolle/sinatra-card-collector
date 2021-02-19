class Card < ActiveRecord::Base
   belongs_to :user
   validates :playername, :team, :card_company, :year, presence: true
end
