class ChangeDateFromDateToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :cards, :year, :integer
  end
end
