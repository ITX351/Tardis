class Place < ActiveRecord::Base
  attr_accessible :category, :image1, :image2, :image3, :intro, :locationx, :locationy, :name, :avatar, :avatar_cache
  has_many :comments

  mount_uploader :avatar, AvatarUploader
end