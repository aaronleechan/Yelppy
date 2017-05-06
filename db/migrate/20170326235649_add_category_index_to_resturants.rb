class AddCategoryIndexToResturants < ActiveRecord::Migration[5.0]
  def change
    add_reference :resturants, :category, index: true
  end
end
