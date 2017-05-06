class AddImageToResturants < ActiveRecord::Migration[5.0]
  def change
    add_column :resturants, :image, :string
  end
end
