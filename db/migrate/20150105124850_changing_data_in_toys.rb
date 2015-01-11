class ChangingDataInToys < ActiveRecord::Migration
  def change
    change_column :toys, :price, :decimal, precision: 10, scale: 2
    add_index :toys, :name
    add_reference :rooms, :toy, index: true
  end
end
