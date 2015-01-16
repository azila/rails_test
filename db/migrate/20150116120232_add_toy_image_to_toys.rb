class AddToyImageToToys < ActiveRecord::Migration
  def change
    add_column :toys, :toy_image, :string
  end
end
