class AddUserResturantIndexToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :resturant, index: true
    add_reference :reviews, :user, index: true
  end
end
