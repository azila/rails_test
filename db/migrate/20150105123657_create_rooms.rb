class CreateRooms < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :rooms, id: :uuid do |t|

      t.string :name
      t.integer :number
      t.integer :number_of_toys

      t.timestamps
    end
  end
end
