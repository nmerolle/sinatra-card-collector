class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :playername
      t.string :team
      t.integer :year
      t.string :card_company
      t.integer :user_id

    end
  end
end
