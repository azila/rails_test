class CreateToys < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :toys, id: :uuid do |t|
      t.string :name
      t.string :color
      t.integer :price
      t.integer :available_num
      t.uuid :room_id

      t.timestamps
    end
  end
end
