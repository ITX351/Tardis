class Place < ActiveRecord::Base
  attr_accessible :category, :image1, :image2, :image3, :intro, :locationx, :locationy, :name
  has_many :comments

end
