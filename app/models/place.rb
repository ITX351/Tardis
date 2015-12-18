class Place < ActiveRecord::Base
  attr_accessible :classes, :intro, :locationx, :locationy, :name, :avatar, :avatar_cache
  has_many :comments

  mount_uploader :avatar, AvatarUploader
  ajaxful_rateable :stars => 5, :allow_update  => true
end
