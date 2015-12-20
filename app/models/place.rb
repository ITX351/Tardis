class Place < ActiveRecord::Base
  attr_accessible :classes, :intro, :locationx, :locationy, :name, :avatar, :avatar_cache, :hot
  has_many :comments

  mount_uploader :avatar, AvatarUploader
  ajaxful_rateable :stars => 5, :dimensions => [:tot], :allow_update  => true
end
