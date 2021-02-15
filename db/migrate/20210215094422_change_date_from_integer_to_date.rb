class ChangeDateFromIntegerToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :cards, :year, :date
  end
end
