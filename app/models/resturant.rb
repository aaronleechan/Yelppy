class Resturant < ActiveRecord::Base
  has_many :reviews
  belongs_to :category
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :address1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zipcode
  validates_presence_of :phone

  validates_presence_of :price_range

  geocoded_by :full_address
  after_validation :geocode

  mount_uploader :image, ImageUploader

  def full_address
    [address1,address2,city,state,zipcode].join(', ')
  end

  def get_price_string
    @price_string = ""

    (1..price_range.to_i).each do |i|
      @price_string += "$"
    end

    # return price string:
    @price_string
  end

  #Search Form
  def self.search(params)
    resturants = Resturant.where(category_id: params[:category].to_i)
    resturants = resturants.where("name like ? or description like ?", "%#{params[:search]}%","%#{params[:search]}%") if params[:search].present?
    resturants = resturants.near(params[:location],20) if params[:location].present?
    resturants
  end
end

