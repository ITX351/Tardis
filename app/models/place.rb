class Place < ActiveRecord::Base
	attr_accessible :classes, :intro, :locationx, :locationy, :name, :avatar, :avatar_cache, :hot, :user_id
	has_many :comments
	belongs_to :user
	has_many :temp_places
  belongs_to :placeclassify

	mount_uploader :avatar, AvatarUploader
	ajaxful_rateable :stars => 5, :dimensions => [:tot], :allow_update  => true
end
