class TempPlace < ActiveRecord::Base
	attr_accessible :avatar, :avatar_cache, :classes, :intro, :locationx, :locationy, :name, :place_id, :reason, :state, :user_id

	mount_uploader :avatar, AvatarUploader
	belongs_to :user
	belongs_to :place
end
